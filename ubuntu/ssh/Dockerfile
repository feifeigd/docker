
FROM ubuntu

RUN echo "deb http://mirrors.163.com/ubuntu/ precise main universe restricted multiverse" >> /etc/apt/sources.list && \
	echo "deb-src http://mirrors.163.com/ubuntu/ precise main universe restricted multiverse" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.163.com/ubuntu/ precise-security universe main multiverse restricted" >> /etc/apt/sources.list && \
	echo "deb-src http://mirrors.163.com/ubuntu/ precise-security universe main multiverse restricted" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.163.com/ubuntu/ precise-updates universe main multiverse restricted" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.163.com/ubuntu/ precise-proposed universe main multiverse restricted" >> /etc/apt/sources.list && \
	echo "deb-src http://mirrors.163.com/ubuntu/ precise-proposed universe main multiverse restricted" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.163.com/ubuntu/ precise-backports universe main multiverse restricted" >> /etc/apt/sources.list && \
	echo "deb-src http://mirrors.163.com/ubuntu/ precise-backports universe main multiverse restricted" >> /etc/apt/sources.list && \
	echo "deb-src http://mirrors.163.com/ubuntu/ precise-updates universe main multiverse restricted" >> /etc/apt/sources.list && \
	apt-get update && apt-get install -y openssh-server && mkdir -p /var/run/sshd && mkdir -p /root/.ssh && \
	sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginid.so/g' /etc/pam.d/sshd

ADD run.sh /root/run.sh && authorize_keys /root/.ssh/authorized_keys

RUN chmod u+x /root/run.sh
EXPOSE 22
CMD ["/root/run.sh"]

