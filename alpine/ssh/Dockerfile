
FROM alpine-base

RUN apk add --no-cache openssh-server \
    && mkdir -p /root/.ssh && wget -O /root/.ssh/authorized_keys https://raw.githubusercontent.com/feifeigd/docker/master/ssh/authorized_keys \
    && ssh-keygen -P "" -t rsa -f /etc/ssh/ssh_host_rsa_key \
    && ssh-keygen -P "" -t dsa -f /etc/ssh/ssh_host_dsa_key \
    && ssh-keygen -P "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
    && ssh-keygen -P "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key 
# 新建用户，到 abuild组

ADD shell/ /root/
RUN chmod u+x /root/*.sh \
	&& /root/add_user.sh

EXPOSE 22
CMD ["/root/run.sh"]
