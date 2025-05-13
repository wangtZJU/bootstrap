#!/bin/bash
set -e
cd `dirname $0`
source ../shell-env

# TODO: check zsh

if [ ! -d "$HOME/.oh-my-zsh" ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

insert_file "profile0" "$HOME/.profile0" "##### DEFAULT START #####" "##### DEFAULT END #####"
insert_file "zshrc" "$HOME/.zshrc" "##### DEFAULT ZSH SETTINGS START #####" "##### DEFAULT ZSH SETTINGS END #####"
insert_line "$HOME/.bashrc" "source $HOME/.profile0"
