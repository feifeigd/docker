
FROM centos

WORKDIR /root/

RUN yum -y install httpd php || true && \
	yum -y install mysql php-mysqlnd && \
	mkdir -p /var/log/httpd && \
	mkdir -p /var/www && \
	mkdir -p /var/www.html

ENV MYSQL_ADDR localhost:3306
ENV MYSQL_USER test
ENV MYSQL_PASS mypassword

ENV LC_ALL en_US.UTF-8

ADD test.php /var/www/html/test.php
EXPOSE 80

ADD run.sh /root/run.sh
RUN chmod u+x /root/run.sh
CMD /root/run.sh




