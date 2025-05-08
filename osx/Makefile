SHELL = $(PWD)/../shell
OSX_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

include ../sh/Makefile
include ../python/Makefile

.osx-init:
	$(OSX_DIR)/osx-init.sh

.osx-inst-utils:
	@echo "Install OSX utils"
	brew install coreutils # GNU tools
	brew install --cask alt-tab
	brew install maccy
	# brew install hammerspoon --cask

osx-basic-install: .osx-init
	@echo "OSX basic installed"

osx-full-install: osx-basic-install
	@echo "OSX full installed"
