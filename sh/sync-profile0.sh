#!/bin/bash
cd `dirname $0`
source ../shell-env

sync_content "profile0" "$HOME/.profile0" "##### DEFAULT START #####" "##### DEFAULT END #####"
