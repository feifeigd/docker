
# dockerfiles-centos-ssh

# Building & Running

build the container:
    # sudo docker build -t centos6.6-ssh .

To run:
    # sudo docker container run -d -p 22 centos6.6-ssh

Get the port that the container is listening on:
```
# sudo docker container ls
```
To test, use the port that was just located:
    # ssh -p xxx luofei@localhost


