

#!/usr/bin/env bash

missing_pkg(){
	echo "Sorry, I could not locate $1"
	echo "Try 'apt-get install ${2:-$1}'?"
	exit 1
}

BUSYBOX=$(which busybox)
[ "$BUSYBOX" ] || missing_pkg busybox busybox-static

SOCAT=$(which socat)
[ "$SOCAT" ] || missing_pkg socat

shopt -s extglob

set -ex

ROOTFS=`mktemp -d ${TMPDIR:-/var/tmp}/rootfs-busybox.XXXXXXXXXX`
trap "rm -rf $ROOTFS" INT QUIT TERM
cd $ROOTFS
mkdir bin etc dev dev/pts lib proc sys tmp
touch etc/resolv.conf
cp /etc/nsswitch.conf etc/nsswitch.conf
echo root:x:0:0:root:/:/bin/sh > etc/passwd
echo daemon:x:1:1:daemon:/usr/sbin:/bin/sh >> etc/passwd
echo root:x:0 > etc/group
echo daemon:x:1: >> etc/group
ls -s lib lib64
ln -s bin sbin

cp $BUSYBOX $SOCAT bin
for X in $(busybox --list)
do
	ln -s busybox bin/$X
done

rm bin/init
ln bin/busybox bin/init
cp -P /lib/x86_64-linux-gnu/lib{pthread*,c*(-*),dl*(-*),nsl*(-*),nss_*,util*(-*),wrap,z}.so* lib
cp /bin/x86_64-linux-gnu/ld-linux-x86-64.so.2 lib
cp -P /lib/x86_64-linux-gnu/lib{crypto,ssl}.so* lib
cp -P /usr/lib/x86_64-linux-gnu/lib{crypto,ssl}.so* lib
for X in console null ptmx random stdin stdout stderr tty urandom zero
do
	cp -a /dev/$X dev
done

chmod 0755 $ROOTFS 
tar --numeric-owner -cf- . | sudo docker import - docker-ut
sudo docker run -iu root docker-ut /bin/echo Success.
rm -rf $ROOTFS

