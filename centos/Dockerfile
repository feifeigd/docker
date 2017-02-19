
FROM centos

MAINTAINER feifeigd "502207456@qq.com"

RUN yum -y install subversion

# 启动SVN服务
ENTRYPOINT /usr/bin/svnserve -d -r /svndata/repository && /bin/bash
