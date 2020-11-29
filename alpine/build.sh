#!/usr/bin/env sh

# 有些有依赖关系的，不能按照字母顺序构建
docker image build -t alpine-base:3.12   base
docker image build -t ssh-alpine         ssh  
docker image build -t gcc-alpine         gcc
docker image build -t clang-alpine       clang
docker image build -t nginx-alpine       nginx
docker image build -t php-alpine         php
docker image build -t redis-alpine       redis
docker image build -t shadowsocks-alpine shadowsocks
docker image build -t skynet-alpine      skynet
docker image build -t svn-alpine         svn
docker image build -t thinkphp           thinkphp
