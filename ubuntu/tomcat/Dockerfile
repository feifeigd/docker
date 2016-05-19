# 基于Ubuntu的tomcat镜像

# 基于官方ubuntu镜像
FROM ubuntu

# 维护者
MAINTAINER feifeigd "502207456@qq.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

清理所有软件缓存
RUN apt-get clean

# 删除系统不再使用的孤立软件
RUN apt-get autoremove

ENTRYPOINT java -version
