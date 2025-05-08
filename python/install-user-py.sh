#!/bin/bash
cd `dirname $0`
source ../shell-env

if [ ! -d "$PY_HOME" ]; then
    echo "Creating user level python env in path $PY_HOME..."
    $PY_EXEC -m venv $PY_HOME
    echo -e "Add ${COLOR_GREEN}VIRTUAL_ENV_DISABLE_PROMPT=1 source ${PY_HOME}/bin/activate${COLOR_NONE} into your .zshrc/.bashrc"
fi
