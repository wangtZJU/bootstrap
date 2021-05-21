#!/bin/bash

cd `dirname $0`
source utils.sh

detect_platform

prepare_git (){
    install_package "git"
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
    prepare_git
    install_package "build-essential"
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
