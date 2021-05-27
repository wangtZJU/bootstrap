#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

configure_git (){
    echo -e "${COLOR_BLUE}Configure git?(y/n, default: n)${COLOR_NONE}"

    if [[ "$(yes_or_no)" == "no" ]]; then
        return 0
    fi

    confirm=""

    while [[ "$confirm" != [yY] ]]; do
        confirm=""
        IFS= read -p "Input your git name: " git_name
        read -p "Input your git email: " git_email

        while [[ "$confirm" != [yYnN] ]]; do
            echo -e "Your name is${COLOR_YELLOW} ${git_name}${COLOR_NONE}, " \
                    "email is${COLOR_YELLOW} ${git_email}${COLOR_NONE}, confirm? (y/n)"
            read confirm
        done
    done

    git config --global user.name "\"$git_name\""
    git config --global user.email "\"$git_email\""
    git config --global pull.ff only
}

init_debian (){
    sudo apt update
    install_package "build-essential" "git" "curl" "net-tools" "findutils"
    configure_git
}

init_osx (){
    # install homebrew
    if ! which brew 1>/dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    configure_git
}

exec_platform_specific_func init
