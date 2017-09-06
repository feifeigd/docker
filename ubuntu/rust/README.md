
参考了这个项目 https://github.com/emk/rust-musl-builder
构建镜像：
```shell
sudo docker image build -t rust-ubuntu .
```

每次改完Dockerfile，需要执行测试：
```shell
./test-image.sh
```

