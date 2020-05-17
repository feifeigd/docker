#!/usr/bin/env sh

username='feifeigd'
# 8 位随机密码
password=`openssl rand -base64 8`
echo "new $username $password"

function remote_spawn()
{
	/usr/bin/expect << EOF
		set timeout 3
		spawn ssh  -o "StrictHostKeyChecking no" $USER_NAME@$IP "passwd"
		expect "*UNIX password:"
		send "$PATROL\r"
		set timout 10
		expect {
			"*$" {send "exit 1\r"}
			"New password:" {send "$PASSWD\r";expect "Retype new password"; send "$PASSWD\r";expect eof}
		}
EOF
}

function local_spawn()
{
	/usr/bin/expect << EOF
		set timeout 3
		spawn passwd
		expect "*UNIX password:"
		send "$PATROL\r"
		set timout 10
		expect {
			"*$" {send "exit 1\r"}
			"New password:" {send "$PASSWD\r";expect "Retype new password"; send "$PASSWD\r";expect eof}
		}
EOF
}

# adduser_spawn user_name password
function adduser_spawn()
{
	user_name=$1
	password=$2
	/usr/bin/expect << EOF
		set timeout 3
		spawn adduser -G abuild $user_name
		set timout 10
		expect {
			"*$" {send "exit 1\r"}
			"New password:" {send "$password\r";expect "Retype new password"; send "$password\r";expect eof}
		}
EOF
}

adduser_spawn 'feifeigd' $password
git config --global user.name $username
git config --global user.email "feifeigd@21cn.com"
