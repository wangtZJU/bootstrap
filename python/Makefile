SHELL = $(PWD)/../shell
PYTHON_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

.inst-venv:
	pip3 install --user virtualenv

.inst-user-py: .inst-venv
	./install-user-py.sh

## this should be done after installing user py
.inst-user-utils:
	pip install ipython jinja-cli clang-format
