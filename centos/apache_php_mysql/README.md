用```-e```覆盖Dockerfile默认的变量
```{engine=shell}
sudo docker run --name 容器名字 -d -e MYSQL_ADDR=192.168.1.2:3306 镜像名字
```
