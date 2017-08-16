
FROM alpine

RUN apk --no-cache add clang cmake ctags git make openssl openssh-client python3 subversion vim \
  && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
  && wget -O ~/.vimrc https://raw.githubusercontent.com/yangyangwithgnu/use_vim_as_ide/master/.vimrc

# 首次运行vim，需要执行 
# :PluginInstall
