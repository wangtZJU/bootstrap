#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

configure_git (){
    yes_or_no "no" "Configure git?(y/n, default: n)"

    if [[ "$yn_choice" == "no" ]]; then
        return 0
    fi

    confirm=""

    while [[ "$confirm" != [yY] ]]; do
        confirm=""
        IFS= read -p "Input your git name: " git_name
        read -p "Input your git email: " git_email

        while [[ "$confirm" != [yYnN] ]]; do
            echo -e "Your name is${COLOR_CYAN} ${git_name}${COLOR_NONE}, " \
                    "email is${COLOR_CYAN} ${git_email}${COLOR_NONE}, confirm? (y/n)"
            read confirm
        done
    done

    git config --global user.name "\"$git_name\""
    git config --global user.email "\"$git_email\""
    git config --global pull.ff only
}

configure_basic_packages_debian (){
    yes_or_no "no" "Configure basic packages?(y/n, default: n)"

    if [[ "$yn_choice" == "no" ]]; then
        return 0
    fi

    sudo apt update
    install_package "build-essential" "git" "curl" "net-tools" "findutils" \
        "python" "python-pip"
}

configure_utils (){
    yes_or_no "no" "Configure utils?(y/n, default: n)"

    if [[ "$yn_choice" == "no" ]]; then
        return 0
    fi

    mkdir -p $HOME/Utils/bin
    mkdir -p $HOME/Utils/env
}

configure_profile0 (){
    yes_or_no "no" "Configure profile0 file?(y/n, default: n)"

    if [[ "$yn_choice" == "no" ]]; then
        return 0
    fi

    if [[ -f "$HOME/.profile0" ]]; then
        echo -e "${COLOR_YELLOW}~/.profile0 already exists, overwrite?${COLOR_NONE}"
        yes_or_no "no"

        if  [ $yn_choice == "yes" ]; then
            mv "$HOME/.profile0" "$HOME/.profile0.bak"
            cp profile0 "$HOME/.profile0"
            echo -e "${COLOR_GREEN}Move old ~/.profile0 to ~/.profile0.bak${COLOR_NONE}"
        fi
    else
        cp profile0 "$HOME/.profile0"
    fi

    if ! grep -q 'source $HOME/.profile0' "$HOME/.bashrc" 2>/dev/null ; then
        echo 'source $HOME/.profile0' >> $HOME/.bashrc
    fi

    if ! grep -q 'source $HOME/.profile0' "$HOME/.bash_profile" 2>/dev/null ; then
        echo 'source $HOME/.profile0' >> $HOME/.bash_profile
    fi

    if ! grep -q 'source $HOME/.profile0' "$HOME/.zshrc" 2>/dev/null ; then
        echo 'source $HOME/.profile0' >> $HOME/.zshrc
    fi
}

init_debian (){
    configure_basic_packages_debian
    configure_utils
    configure_profile0
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
