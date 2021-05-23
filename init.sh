#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

detect_platform

prepare_git (){
    install_package "git"
    echo "Configure git?(y/n, default: n)"

    if [[ "$(yes_or_no)" == "no" ]]; then
        return 0
    fi

    confirm=""

    while [[ "$confirm" != [yY] ]]; do
        confirm=""
        IFS= read -p "Input your git name: " git_name
        read -p "Input your git email: " git_email

        while [[ "$confirm" != [yYnN] ]]; do
            echo -e "Your name is${COLOR_LIGHT_RED} ${git_name}${COLOR_NONE}, " \
                    "your email is${COLOR_LIGHT_RED} ${git_email}${COLOR_NONE}, confirm? (y/n)"
            read confirm
        done
    done

    git config --global user.name "\"$git_name\""
    git config --global user.email "\"$git_email\""
}

init_debian (){
    sudo apt update
    install_package "build-essential" "curl" "net-tools"
    prepare_git
}

init_osx (){
    # TODO: install homebrew
    :;
}

case $os_platform in
    debian)
        init_debian
        ;;
    osx)
        init_osx
        ;;
    *)
        echo "unsupport platform"
esac
