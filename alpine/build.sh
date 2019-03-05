#!/usr/bin/env sh

# 有些有依赖关系的，不能按照字母顺序构建
docker build -t alpine-base			base
docker build -t clang-alpine		clang
docker build -t ssh-alpine			ssh  
docker build -t gcc-alpine			gcc
docker build -t nginx-alpine		nginx
docker build -t php-alpine		    php
docker build -t redis-alpine		redis
docker build -t shadowsocks-alpine	shadowsocks
docker build -t skynet-alpine		skynet
docker build -t svn-alpine			svn
docker build -t thinkphp 			thinkphp
