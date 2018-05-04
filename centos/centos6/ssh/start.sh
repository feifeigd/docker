#!/bin/bash

__create_user(){
    # Create a user to SSH into as.
    useradd luofei
    SSH_USERPASS=newpass
    # 用私钥登陆，不要使用密码登陆，所以不用设置密码
    # echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin luofei)
}

# Call all functions
__create_user

