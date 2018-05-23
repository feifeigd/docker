# see https://github.com/CentOS/CentOS-Dockerfiles/blob/master/ssh/centos7/Dockerfile

FROM centos:centos7

MAINTAINER feifeigd <502207456@qq.com>


# ADD ./start.sh /start.sh

# 创建账号luofei，无密码，用私钥登陆，免密sudo
RUN yum -y update && yum -y install openssh-server sudo wget && yum clean all \
    && echo "luofei ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && mkdir /var/run/sshd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
    && ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N '' \
    && useradd luofei \
    && mkdir -p /home/luofei/.ssh && wget -O /home/luofei/.ssh/authorized_keys https://raw.githubusercontent.com/feifeigd/docker/master/ssh/authorized_keys \
    && mkdir -p /root/.ssh && cp /home/luofei/.ssh/authorized_keys /root/.ssh/

CMD /usr/sbin/sshd -D

