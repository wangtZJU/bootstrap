#!/bin/bash
cd `dirname $0`
source ../shell-env

git config --global user.name "Wang Tao"
git config --global user.email "wangtao.2077@bytedance.com"
git config --global pull.ff "only"
git config --global push.autosetupremote "true"
git config --global diff.tool "vimdiff"
git config --global merge.tool "vimdiff"
