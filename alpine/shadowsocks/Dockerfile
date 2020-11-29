
FROM alpine

RUN apk --no-cache add py-pip \
   && pip install shadowsocks

COPY shadowsocks.json /etc/shadowsocks.json

CMD ssserver -c /etc/shadowsocks.json
