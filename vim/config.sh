#!/bin/bash
set -e
cd `dirname $0`
source ../shell-env

touch $HOME/.vimrc
cp "$HOME/.vimrc" "$HOME/.vimrc.bak"
cp ./vimrc $HOME/.vimrc

if [[ ! -d "$HOME/.vim/bundle" ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

vim -E -s -u $HOME/.vimrc +PluginInstall! +PluginClean! +qall

mkdir -p $HOME/.vim/files/swap
