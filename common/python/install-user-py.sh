#!/bin/bash
cd `dirname $0`
source ../common.sh

PY_VERSION="${PY_VERSION:-3.9}"
PY_EXEC="python${PY_VERSION}"
USER_PY_HOME="~/.py${PY_VERSION}"

if ! which $PY_EXEC; then
    echo "Python ${PY_VERSION} not found in path!"
    exit 1
fi

virtualenv -p ${PY_EXEC} ${USER_PY_HOME}

echo -e "Add ${COLOR_GREEN}VIRTUAL_ENV_DISABLE_PROMPT=1 ${USER_PY_HOME}/bin/active${COLOR_NONE} into your .zshrc/.bashrc"

