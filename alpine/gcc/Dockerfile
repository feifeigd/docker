
FROM alpine

RUN apk --no-cache add cmake ctags curl curl-dev gcc git gnupg g++ make openssl openssl-dev openssh-client pcre-dev python3 subversion vim \
  && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
  && wget -O ~/.vimrc https://raw.githubusercontent.com/yangyangwithgnu/use_vim_as_ide/master/.vimrc
  && vim +PluginInstall +qall
