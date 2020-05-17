FROM alpine:3.11

# 使用国内阿里云的源,安装必要的包
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 安装常用工具
RUN apk --no-cache add expect vim
