# 基于Ubuntu的tomcat镜像

# 基于官方ubuntu镜像
FROM ubuntu

# 维护者
MAINTAINER feifeigd "502207456@qq.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list.d/docker.list && apt-get update

# 安装curl、ping指令
RUN apt-get -y install iputils-ping curl

# 安装JDK
RUN cd /tmp && curl -L 'http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockfile' | tar -xz


# 清理所有软件缓存，删除系统不再使用的孤立软件，清除临时文件
# RUN apt-get clean && apt-get autoremove && rm -rf /tmp/*

# ENTRYPOINT java -version
