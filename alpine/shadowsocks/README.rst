
构建镜像
sudo docker image build -t shadowsocks-alpine .

运行
sudo docker container run --rm -p 8388:8388 -v 你自定义的shadowsocks.json:/etc/shadowsocks.json shadowsocks-alpine 

