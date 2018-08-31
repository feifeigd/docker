构建镜像
```
sudo docker image -t svn-alpine .
```
运行一个容器
```
sudo docker container run -d --restart=always --name=svn-server  -p 3690:3690 -v /var/opt/svn:/var/svn svn-alpine  
```
实例,运行跟宿主机同一个网络的容器：
```
sudo docker run --name=svn192.168.0.159 --net=internal_net --ip=192.168.0.159 -d --restart=always  -v /home/luofei/data/192.168.0.159/svndata/repository:/var/svn svn-alpine:20180831
```
由于开发的一些特殊需求，需要将容器部署在与宿主机同一个网段中，部署步骤如下：

步骤一：创建网络
$ docker network create -d macvlan --subnet=172.16.0.0/24 --gateway=172.16.0.1 -o parent=ceno16777736 mynet
548d79fe04c613d3ca180e8689f2207f71534020bc39566d62d0b5aeb67fc8b5

参数解析：
-d macvlan  加载kernel的模块名
--subnet 宿主机所在网段
--gateway 宿主机所在网段网关
-o parent 继承指定网段的网卡

步骤二：运行容器
$ docker run --net=mynet --ip=172.16.0.100 -it -d --rm centos:6.7 /bin/bash

参数解析：
--ip 可以指定容器的IP 

来源： http://blog.sina.com.cn/s/blog_13ea37b210102x03x.html

实验：

sudo docker network create -d macvlan --subnet=192.168.0.0/24 --gateway=192.168.0.1 -o parent=em1 internal_net
运行一个容器，指定与宿主同一网段的ip
 sudo docker run --net=internal_net --ip=192.168.0.79 -it --rm centos /bin/bash

验证ok。
在docker 1.13验证
 sudo docker run --net=internal_net --ip=192.168.0.80 -itd --name=machine-80 --restart=always centos 
 sudo docker run --net=internal_net --ip=192.168.0.55 -itd --name=svn192.168.0.55 --restart=always -v /home/luofei/data/192.168.0.55/svndata/repository:/svndata/repository xhsvn
sudo docker run --net=internal_net --ip=192.168.0.80 -itd --name=machine-80 --rm -v /home/luofei:/svndata/repository xhsvn
