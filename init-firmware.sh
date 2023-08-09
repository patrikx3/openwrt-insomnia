#!/usr/bin/env bash
VERSION="23.05.0-rc2"
rm -rf build-openwrt/
mkdir build-openwrt
pushd build-openwrt
wget https://downloads.openwrt.org/releases/${VERSION}/targets/mvebu/cortexa9/openwrt-imagebuilder-${VERSION}-mvebu-cortexa9.Linux-x86_64.tar.xz
tar xf openwrt-imagebuilder-${VERSION}-mvebu-cortexa9.Linux-x86_64.tar.xz
rm rf openwrt-imagebuilder-${VERSION}-mvebu-cortexa9.Linux-x86_64.tar.xz
cp ../make-firmware.sh openwrt-imagebuilder-${VERSION}-mvebu-cortexa9.Linux-x86_64/
pushd openwrt-imagebuilder-${VERSION}-mvebu-cortexa9.Linux-x86_64/
./make-firmware.sh