#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
watch -n 120 'echo "bin" && find /build/source/bin -type f | wc -l && echo "" && echo "dl" && find /build/source/dl -type f | wc -l && echo ""  && echo "mwlwifi is built" && find ./bin/ -type f -iname "*copy*" && echo "" && cat .config | grep CONFIG_TARGET_PROFILE'
