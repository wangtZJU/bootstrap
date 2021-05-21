COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[1;33m'
COLOR_GREEN='\033[0;32m'
COLOR_BLUE='\033[0;34m'
COLOR_LIGHT_RED='\033[1;31m'
COLOR_NONE='\033[0m'

# set `os_platform` manually if this doesn't work

detect_platform (){
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
}

install_package (){
    package=$1
    version=$2

    if [[ -z "${os_platform}" ]]; then
        detect_platform
    fi

    if [ "${os_platform}" == "unknown" ]; then
        echo "Unsupport platform!"
        exit 1
    fi

    case $os_platform in
        debian )
            if [[ -z "${version}" ]]; then
                sudo apt install -yqq $package
            else
                sudo apt install -yqq $package=$version
            fi
            ;;
        osx )
            # TODO
            ;;
    esac

}
