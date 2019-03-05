
FROM alpine-base

RUN apk --no-cache add py2-pip \
   && pip install shadowsocks

COPY shadowsocks.json /etc/shadowsocks.json

CMD ssserver -c /etc/shadowsocks.json
