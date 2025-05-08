SHELL = $(PWD)/../shell
PYTHON_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

.python-install-user-py:
	$(PYTHON_DIR)/install-user-py.sh

## this should be done after installing user py
# .inst-user-utils: .inst-user-py
# 	pip install ipython jinja-cli clang-format
