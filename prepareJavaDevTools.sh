#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

input_jdk_version (){
    echo -e "${COLOR_GREEN}Which jdk version would you like to install?(8/11, default: 8)${COLOR_NONE}"
    read installed_jdk_version

    case $installed_jdk_version in
        "" )
            installed_jdk_version=8
            ;;
        8 | 11 )
            ;;
        * )
            echo "unsupport jdk version!"
            exit 1
    esac
}

install_jdk (){
    :;
}

configure_jdk (){
    :;
}

input_jdk_version
echo $installed_jdk_version

