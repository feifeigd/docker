
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

# Install packages
RUN apt-get install -y \
	autoconf \
	gcc	\
	unzip	\
	wget
# Install Java
RUN apt-get install -y openjdk-8-jdk

# Clean Up Apt-get
RUN rm -rf /var/lib/apt/lists/* && apt-get clean

# Install Android SDK
# TODO 安装新版本
RUN wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
RUN tar -xvzf android-sdk_r24.4.1-linux.tgz
RUN mv android-sdk-linux /usr/local/android-sdk
RUN rm android-sdk_r24.4.1-linux.tgz

ENV ANDROID_COMPONENTS platform-tools,android-23,build-tools-23.0.2,build-tools-24.0.0

# Install Android tools
RUN echo y | /usr/local/android-sdk/tools/android update sdk --filter "${ANDROID_COMPONENTS}" --no-ui -a

# Install Android NDK
RUN wget http://dl.google.com/android/repository/android-ndk-r12-linux-x86_64.zip
RUN unzip android-ndk-r12-linux-x86_64.zip
RUN mv android-ndk-r12 /usr/local/android-sdk
RUN rm android-ndk-r12-linux-x86_64.zip

# Environment variables
ENV ANDROID_HOME /usr/local/android-sdk
ENV ANDROID_SDK_HOME $ANDROID_HOME
ENV ANDROID_NDK_HOME /usr/local/android-ndk
ENV JENKINS_HOME $HOME
ENV PATH $INFER_HOME/bin:$PATH
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools
ENV PATH $PATH:$ANDROID_SDK_HOME/build-tools/23.0.2
ENV PATH $PATH:$ANDROID_SDK_HOME/build-tools/24.0.0
ENV PATH $PATH:$ANDROID_SDK_HOME

# Export JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Support Gradle
ENV TERM dumb
ENV JAVA_OPTS "-Xms4096m -Xmx4096m"
ENV GRADLE_OPTS "-XX:+UseG1GC -XX:MaxGCPauseMillis=1000"

# Clean
RUN apt-get clean

# Add build user account,values are set to default below
ENV RUN_USER mobileci
ENV RUN_UID 5089

RUN id $RUN_USER || adduser --uid "$RUN_UID" \
	--gecos 'Build User' \
	--shell '/bin/sh' 	\
	--disabled-login	\
	--dieabled-password "$RUN_USER"

# Fix permissions
RUN chown -R $RUN_USER:$RUN_USER $ANDROID_HOME $ANDROID_SDK_HOME $ANDROID_NDK_HOME
RUN chmod -R a+rx $ANDROID_HOME $ANDROID_SDK_HOME $ANDROID_NDK_HOME

# Creating project directories prepared for build when running
# `docker run`
ENV PROJECT /project
RUN mkdir $PROJECT
RUN chown -R $RUN_USER:$RUN_USER $PROJECT
WORKDIR $PROJECT

USER $RUN_USER
RUN echo "sdk.dir=$ANDROID_HOME" > local.properties

