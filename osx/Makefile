SHELL = $(PWD)/../shell
OSX_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

include ../sh/Makefile
include ../common/Makefile

.osx-init:
	$(OSX_DIR)/init.sh

.osx-inst-utils:
	@echo "Install OSX utils"
	brew install --cask iterm2
	brew install coreutils # GNU tools
	brew install --cask alt-tab
	brew install maccy
	# brew install hammerspoon --cask

osx-basic-install: \
	.osx-init \
	.common-install-user-py \
	.common-config-git \
	.sh-sync-profile0
	@echo "OSX basic installed"

osx-full-install: osx-basic-install .osx-inst-utils
	@echo "OSX full installed"
