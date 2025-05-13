SHELL = $(PWD)/../shell
COMMON_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

.common-install-user-py:
	$(COMMON_DIR)/install-user-py.sh

.common-config-git:
	$(COMMON_DIR)/config-git.sh

.common-install-py-utils:
	pip install jinja-cli jq
