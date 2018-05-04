```shell
sudo docker image build -t gcc-alpine .
```

跑ssh
```shell
sudo docker container run --rm -it -p 1022:22 gcc-alpine
```
