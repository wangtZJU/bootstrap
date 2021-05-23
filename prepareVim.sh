#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

install_package "vim"

mkdir -p $HOME/.vim/files/swap

if [[ ! -d "$HOME/.vim/bundle" ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp ./vimrc ~/.vimrc

vim -E -s -u ~/.vimrc +PluginInstall! +PluginClean! +qall

