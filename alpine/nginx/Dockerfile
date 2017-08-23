
FROM alpine

RUN apk --no-cache add nginx

# /run/nginx/nginx.pid
VOLUME /run/nginx/
# 配置路径 /etc/nginx/

COPY index.html /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]

