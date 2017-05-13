#!/bin/env bash

mysqld_safe &
sleep 30
mysql -e "grant all privileges on *.* to 'MYSQL_USER'@'%' identified by '$MYSQL_PASS' with grant option;"

mysql -e "create database scores"
mysql -e "create table scores.name_score(name char(20)not null, score int not null)default charset=utf8;"
mysql -e "insert into scores.name_score values('liming',80),('zhangjun',90),('wangxiaoer',95);"

