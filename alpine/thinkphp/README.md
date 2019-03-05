构建docker镜像
```shell
docker build -t thinkphp .
```

下载ThinkPHP源码

1. 克隆下载应用项目仓库
    ```
    git clone https://github.com/top-think/think tp5
    ```
2. 然后切换到tp5目录下面，再克隆核心框架仓库
    ```
    git clone https://github.com/top-think/framework thinkphp
	```

docker-compose跑起来
```
docker-compose up
```
