#!/bin/sh

NGINX_VERSION=1.20.1
GPG_KEYS=B0F4253373F8F6F510D42178520A9993A1C052F8

apk --no-cache add --virtual .build-deps \
	curl \
	gcc \
	gnupg \
	libc-dev \
	make \
	pcre-dev \
	zlib-dev
CONFIG="\
	--build="$USER build at `date +%Y%m%d`" \
	--with-stream \
	--with-threads \
	"
cd /tmp
curl -fSL http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -o nginx.tar.gz
curl -fSL http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz.asc -o nginx.tar.gz.asc
export GNUPGHOME=`mktemp -d`
found=''
for server in \
	ha.pool.sks-keyservers.net \
	hkp://keyserver.ubuntu.com:80 \
	hkp://p80.pool.sks-keyservers.net:80 \
	pgp.mit.edu \
; do
	echo "Fetching GPG key $GPG_KEYS from $server"
	gpg --keyserver "$server" --keyserver-options timeout=10 --recv-keys "$GPG_KEYS" && found=yes && break
done;
test -z "$found" && echo >&2 "error: failed to fetch GPG key $GPG_KEYS" && exit 1
echo verify ngingx.tar.gz...
gpg --batch --verify nginx.tar.gz.asc nginx.tar.gz
mkdir -p src
tar -zxC src -f nginx.tar.gz
cd src/nginx-$NGINX_VERSION
./configure $CONFIG # --with-debug
make -j`getconf _NPROCESSORS_ONLN` && make install

binary="/usr/local/nginx/sbin/nginx"
strip $binary
runDeps=`scanelf --needed --nobanner $binary |awk '{gsub(/,/, "\nso:",$2);print "so:"$2}'|xargs apk info --installed|sort -u`
echo "install runDeps=$runDeps"
apk del .build-deps
apk --no-cache add $runDeps
rm -rf /tmp/*
