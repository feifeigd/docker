
FROM alpine

# 使用国内的源,安装必要的包
RUN echo http://mirrors.ustc.edu.cn/alpine/v3.7/main/ > /etc/apk/repositories \
  && echo http://mirrors.ustc.edu.cn/alpine/v3.7/community/ >> /etc/apk/repositories \
  && echo https://mirror.tuna.tsinghua.edu.cn/alpine/v3.7/main/ >> /etc/apk/repositories \
  && echo https://mirror.tuna.tsinghua.edu.cn/alpine/v3.7/community/ >> /etc/apk/repositories \
  && apk --no-cache add cmake ctags curl curl-dev gcc git gnupg g++ make openssl openssl-dev openssh-client pcre-dev python3 subversion vim \
  
  #&& cd /tmp \
  #&& git clone https://github.com/sysprogs/CMake.git \
  #&& cd CMake && mkdir build && cd build && ../configure && make && sudo make install \
  #&& rm -rf ./* \
  
  #&& git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \  
  #&& wget -O ~/.vimrc https://raw.githubusercontent.com/yangyangwithgnu/use_vim_as_ide/master/.vimrc \
  #&& vim +PluginInstall +qall
