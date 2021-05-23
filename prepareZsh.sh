#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

install_package "zsh"

if [[ -z "$ZSH" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

cp zshrc.local $HOME/.zshrc.local

if ! grep -q 'source $HOME/.zshrc.local' "$HOME/.zshrc"; then
    echo 'source $HOME/.zshrc.local' >> $HOME/.zshrc
fi

chsh -s /bin/zsh
