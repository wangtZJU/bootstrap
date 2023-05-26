#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

install_py3_debian (){
    install_package "python3" "python3-pip"
}

install_py3_osx (){
    :;
}

exec_platform_specific_func install_py3
