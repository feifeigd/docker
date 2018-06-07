```shell
sudo docker image build -t gcc-alpine .
```

跑ssh
docker 加上 --security-opt seccomp=unconfined 才能用gdb调试进程
```shell
sudo docker container run --rm -it -p 1022:22 --security-opt seccomp=unconfined gcc-alpine
```
