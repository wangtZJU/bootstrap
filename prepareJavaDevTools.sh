#!/bin/bash
set -e
cd `dirname $0`
source utils.sh

input_jdk_version (){
    echo -e "${COLOR_BLUE}Which jdk version would you like to install?(8/11, default: 8)${COLOR_NONE}"
    read installed_jdk_version

    case $installed_jdk_version in
        "" )
            installed_jdk_version=1.8
            ;;
        8 )
            installed_jdk_version=1.8
            ;;
        11 )
            ;;
        * )
            echo -e "${COLOR_RED}unsupport jdk version!${COLOR_NONE}"
            exit 1
    esac
}

install_jdk_osx (){
    local package_name

    case $installed_jdk_version in
        1.8 )
            package_name="AdoptOpenJDK/openjdk/adoptopenjdk8"
            ;;
        11 )
            package_name="AdoptOpenJDK/openjdk/adoptopenjdk11"
            ;;
    esac

    install_homebrew_cask $package_name
    echo -e "
${COLOR_GREEN}To set the default jdk version in osx, use:${COLOR_NONE}

export JAVA_HOME=\$(/usr/libexec/java_home -v\"${installed_jdk_version}\");

${COLOR_GREEN}To switch the jdk version in osx, use:${COLOR_NONE}

jdk() {
      version=\$1
      unset JAVA_HOME;
      export JAVA_HOME=\$(/usr/libexec/java_home -v\"\$version\");
      java -version
}

    "
}

install_maven (){
    install_package maven
}

input_jdk_version
exec_platform_specific_func install_jdk
install_maven

