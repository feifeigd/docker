
FROM alpine:3.11

ENV ALPINE_VERSION 3.11

# 使用国内的源,安装必要的包
RUN echo http://mirrors.aliyun.com/alpine/v$ALPINE_VERSION/main > /etc/apk/repositories \
    echo echo http://mirrors.aliyun.com/alpine/v$ALPINE_VERSION/community >> /etc/apk/repositories 

