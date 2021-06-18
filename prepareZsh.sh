#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

install_package "zsh"

if [[ -z "$ZSH" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

yes_or_no "no" "Change shell?(y/n, default: n)"

if [[ "$yn_choice" == "yes" ]]; then
    chsh -s /bin/zsh
fi

