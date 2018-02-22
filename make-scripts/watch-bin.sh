#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
watch -n 120 'echo "bin" && find /build/source/bin -type f | wc -l && echo "" && echo node && find /build/source/bin -type f -iname 'node*' | wc -l && echo "" && echo mariadb && find /build/source/bin -type f -iname 'mariadb*' | wc -l && echo "" && echo redis && find /build/source/bin -type f -iname 'redis*' | wc -l && echo "" && echo "dl" && find /build/source/dl -type f | wc -l && echo ""  && echo "mwlwifi is built" && find ./bin/ -type f -iname "*mwlwifi*" && echo "" && echo "" && cat .config | grep "CONFIG_TARGET_PROFILE\|CONFIG_VERSION_DIST"'
