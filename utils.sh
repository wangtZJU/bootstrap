COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[1;33m'
COLOR_GREEN='\033[0;32m'
COLOR_BLUE='\033[1;34m'
COLOR_CYAN='\033[0;36m'
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

yes_or_no (){
    defval=$1
    prompt=$2

    if [ $defval != "yes" ] && [ $defval != "no" ]; then
        echo "${COLOR_RED}defval is illegal!${COLOR_NONE}"
        exit 1
    fi

    if [[ ! -z $prompt ]]; then
        echo -e "${COLOR_BLUE}${prompt}${COLOR_NONE}"
    fi

    read yes_or_no

    case $yes_or_no in
        "" )
            yn_choice=$defval
            ;;
        y | Y )
            yn_choice="yes"
            ;;
        *)
            yn_choice="no"
            ;;
    esac
}

install_package_debian (){
    if [ ! -z $skip_install ]; then
        echo -e "${COLOR_GREEN}Skip install packages: $@ ${COLOR_NONE}"
        return 0
    fi

    if [ -z $not_sudo_check ]; then
        not_sudo_check=1
        set +e
        if ! sudo -v 2>/dev/null ; then
            yes_or_no "no" "${COLOR_YELLOW}Not a sudo user, skip package install? ${COLOR_NONE}"

            if [[ $yn_choice == "yes" ]]; then
                skip_install=1
                return 0
            else
                exit 0
            fi
        fi
        set -e
    fi
    sudo apt install -yqq "$@"
}

install_package (){
    check_platform

    case $os_platform in
        debian )
            install_package_debian "$@"
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

exec_platform_specific_func (){
    local func=$1
    check_platform
    eval "${func}_${os_platform}"
}

