#!/usr/bin/env bash
make image PROFILE=linksys_wrt3200acm PACKAGES="$(< ../../router/linksys_wrt3200acm/opkg-list-installed.txt)"
make image PROFILE=linksys_wrt1900acs PACKAGES="$(< ../../router/linksys_wrt1900acs/opkg-list-installed.txt)"
make image PROFILE=linksys_wrt32x PACKAGES="$(< ../../router/linksys_wrt32x/opkg-list-installed.txt)"