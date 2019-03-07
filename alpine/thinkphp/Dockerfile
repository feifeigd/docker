

FROM alpine-base

RUN apk --no-cache add nginx php7-fpm && \
    mkdir -p /run/nginx

#ADD www /www

ADD nginx.conf /etc/nginx/
# 15行 注释 警告
ADD php-fpm.conf /etc/php7/php-fpm.conf

ADD run.sh /run.sh
RUN chmod +x /run.sh

ENV LISTEN_PORT=80

EXPOSE 80

CMD /run.sh

