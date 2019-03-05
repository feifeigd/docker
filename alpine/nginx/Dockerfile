
FROM alpine-base

# RUN apk --no-cache add nginx

# /run/nginx/nginx.pid
VOLUME /run/nginx/
# 配置路径 /etc/nginx/

COPY build_nginx.sh /tmp/
RUN chmod +x /tmp/build_nginx.sh && /tmp/build_nginx.sh

COPY index.html /usr/local/nginx/html/
COPY default.conf /etc/nginx/conf.d/

EXPOSE 80
STOPSIGNAL SIGTERM
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]

