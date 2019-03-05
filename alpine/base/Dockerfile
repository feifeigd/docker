FROM alpine:3.9

# 使用国内的源,安装必要的包
RUN echo http://mirrors.ustc.edu.cn/alpine/v3.9/main/ > /etc/apk/repositories \
    && echo http://mirrors.ustc.edu.cn/alpine/v3.9/community/ >> /etc/apk/repositories \
    && echo https://mirror.tuna.tsinghua.edu.cn/alpine/v3.9/main/ >> /etc/apk/repositories \
    && echo https://mirror.tuna.tsinghua.edu.cn/alpine/v3.9/community/ >> /etc/apk/repositories

