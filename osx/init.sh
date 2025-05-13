#!/bin/bash
set -e
cd `dirname $0`
source ../shell-env

user_confirm "Will do OS level operations, make sure you have appropriate permissions."

echo -e "Before installing, make sure homebrew have been installed:"
echo -e '    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

if ! which brew &>/dev/null; then
    echo -e "${COLOR_BLUE}Homebrew not found${COLOR_NONE}"
    exit 1
fi

if ! which $PY_EXEC &>/dev/null; then
    echo "Installing $PY_EXEC..."
    brew install "python@${PY_VERSION}"
fi

if ! which $AWK_EXEC &>/dev/null; then
    echo "Installing $AWK_EXEC..."
    brew install gawk
fi

if ! which $SED_EXEC &>/dev/null; then
    echo "Installing $SED_EXEC..."
    brew install gnu-sed
fi

mkdir -p $HOME/Workspace
