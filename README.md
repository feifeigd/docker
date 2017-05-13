# docker
docker learning

运行注册服务器
```shell
sudo docker run -p 5000:5000 -dit registry
```
查看后台容器实时日志
```shell
sudo docker logs -f 容器名字或id
```
查看容器映射到宿主的端口
```shell
sudo docker port 容器名字或id 容器端口
```
查看容器IP地址
```shell
sudo docker inspect --format '{{.NetworkSettings.IPAddress}}' 容器id 
```
