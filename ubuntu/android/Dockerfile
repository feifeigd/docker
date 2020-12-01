
# Android Dockerfile

FROM ubuntu:20.10

MAINTAINER  feifeigd "feifeigd@21cn.com"

ENV DOCKER_ANDROID_LANG zh_CN
ENV DOCKER_ANDROID_DISPLAY_NAME mobileci-docker

#Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive

# Update apt-get
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get -y install -y \
        apt-utils           \
        locales
# Set language to UTF8: this works in pretty much all cases
ENV LANG zh_CN.UTF-8
RUN locale-gen $LANG


#
