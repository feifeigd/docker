
��������
sudo docker image build -t shadowsocks-alpine .

����
sudo docker container run --rm -p 8388:8388 -v ���Զ����shadowsocks.json:/etc/shadowsocks.json shadowsocks-alpine 

