COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[1;33m'
COLOR_GREEN='\033[0;32m'
COLOR_BLUE='\033[0;34m'
COLOR_LIGHT_RED='\033[1;31m'
COLOR_NONE='\033[0m'

# set `os_platform` manually if this doesn't work
check_platform (){
    if [[ -n "${os_platform}" ]]; then
        return 0
    fi

    os_platform="unknown"

    if [[ "$OSTYPE" == "linux"* ]]; then
        distro_id=`lsb_release -d`

        if [[ "$distro_id" == *"Debian"* ]]; then
            os_platform="debian"
        elif [[ "$distro_id" == *"Ubuntu"* ]]; then
            os_platform="debian"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        os_platform="osx"
    fi

    if [[ $os_platform == "unknown" ]]; then
        echo -e "${COLOR_RED}unknown platform found${COLOR_NONE}"
        exit 1
    fi
}

install_package (){
    check_platform

    case $os_platform in
        debian )
            sudo apt install -yqq "$@"
            ;;
        osx )
            brew install "$@"
            ;;
    esac
}

install_homebrew_cask (){
    check_platform

    if [ "${os_platform}" != "osx" ]; then
        echo "${COLOR_RED}not osx platform!${COLOR_NONE}"
        exit 1
    fi

    brew install --cask "$@"
}

yes_or_no (){
    local defval

    if [[ -n "$1" ]]; then
        defval="yes"
    else
        defval="no"
    fi

    read yes_or_no

    case $yes_or_no in
        "" )
            echo $defval
            ;;
        y | Y )
            echo "yes"
            ;;
        *)
            echo "no"
            ;;
    esac
}

exec_platform_specific_func (){
    local func=$1
    check_platform
    eval "${func}_${os_platform}"
}

