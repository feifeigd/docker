
sudo docker image -t svn-alpine .

sudo docker container run -d --restart=always --name=svn-server  -p 3690:3690 -v /var/opt/svn:/var/svn svn-alpine  
