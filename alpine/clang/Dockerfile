
FROM gcc-alpine

RUN apk --no-cache add binutils clang musl-dev vim \
  && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
  && wget -O ~/.vimrc https://raw.githubusercontent.com/yangyangwithgnu/use_vim_as_ide/master/.vimrc

# 首次运行vim，需要执行 
# :PluginInstall
