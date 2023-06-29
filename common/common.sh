#!/bin/bash

export COLOR_RED='\033[0;31m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GREEN='\033[0;32m'
export COLOR_BLUE='\033[1;34m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_NONE='\033[0m'

check_platform (){
    if [[ "$OSTYPE" == "linux"* ]]; then
        distro_id=`lsb_release -d`

        if [[ "$distro_id" == *"Debian"* ]]; then
            export os_platform="debian"
        elif [[ "$distro_id" == *"Ubuntu"* ]]; then
            export os_platform="debian"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        export os_platform="osx"
    fi
}

check_platform

