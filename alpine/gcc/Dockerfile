
FROM ssh-alpine

# 使用国内的源,安装必要的包
RUN apk --no-cache add alpine-sdk ctags curl-dev gdb  gnupg openssl-dev openssh-client pcre2-dev python3 socat subversion  \	
	&& mkdir -p /var/cache/distfiles \
	&& chmod a+w /var/cache/distfiles \
	&& chgrp abuild /var/cache/distfiles \
	&& chmod g+w /var/cache/distfiles

RUN cd /tmp \
  && git clone https://github.com/sysprogs/CMake.git \
  && cd CMake && mkdir build && cd build && ../configure && make && make install \
  && rm -rf ./* 
  
  #&& git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \  
  #&& wget -O ~/.vimrc https://raw.githubusercontent.com/yangyangwithgnu/use_vim_as_ide/master/.vimrc \
  #&& vim +PluginInstall +qall
