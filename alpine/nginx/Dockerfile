
FROM alpine

RUN apk --no-cache add nginx

# /run/nginx/nginx.pid
VOLUME /run/nginx/
# 配置路径 /etc/nginx/
CMD ["nginx", "-g", "daemon off;"]

