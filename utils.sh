# set `os_platform` manually if this doesn't work
detect_platform (){
    os_platform="unknown"

    if [[ "$OSTYPE" == "linux"* ]]; then
        distro_id=`lsb_release -d`

        if [[ "$distro_id" == *"Debian"* ]]; then
            os_platform="debian"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        os_platform="osx"
    fi
}

install_package (){
    if [[ -z "${os_platform}" ]]; then
        detect_platform
    fi

    if [ "${os_platform}" == "unknown" ]; then
        echo "Unsupport platform!"
        exit 1
    fi

}
