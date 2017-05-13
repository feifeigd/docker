


FROM centos

WORKDIR /root/

RUN yum -y install wget && \
	wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm && \
	rpm -ivh /root/mysql-community-release-el7-5.noarch.rpm && \
	yum -y install mysql-server && \
	mysql_install_db --user=mysql

ENV MYSQL_USER test
ENV MYSQL_PASS mypassword
ENV LC_ALL en_US.UTF-8

ADD build_table.sh /root/build_table.sh
RUN chmod u+x /root/build_table.sh && /root/build_table.sh

EXPOSE 3306

ADD run.sh /root/run.sh
RUN chmod u+x /root/run.sh 
CMD /root/run.sh

