#!/bin/bash

# description "Start Tmux"

/bin/sleep 15
# Ensure the environment is available
source /home/luofei/.bashrc

# create a new tmux session named docker
/usr/bin/tmux new-session -d -s docker

/usr/bin/tmux send-keys -t docker:0 "cd /home/luofei/code/docker/d7kj && sudo docker-compose up" C-m
/bin/sleep 10

# 添加到开机启动 可以写入/etc/rc.local文件里面
# /home/luofei/code/docker/OnReboot.sh
# 或 crontab -e
# @reboot /home/luofei/code/docker/OnReboot.sh

