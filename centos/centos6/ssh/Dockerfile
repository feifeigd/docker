
# see https://github.com/CentOS/CentOS-Dockerfiles/blob/master/ssh/centos6/Dockerfile

FROM centos:centos6.6

MAINTAINER feifeigd <502207456@qq.com>


# ADD ./start.sh /start.sh

# 创建账号luofei，无密码，用私钥登陆，免密sudo
RUN yum -y update && yum -y install openssh-server passwd sudo wget && yum clean all \
    && echo "luofei ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && mkdir /var/run/sshd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
    && useradd luofei \
    && mkdir -p /home/luofei/.ssh && wget -O /home/luofei/.ssh/authorized_keys https://raw.githubusercontent.com/feifeigd/docker/master/ssh/authorized_keys 

ENTRYPOINT /usr/sbin/sshd -D


