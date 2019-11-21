#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

USER=patrikx3

mkdir -p $DIR/build-openwrt
BUILD_DIR_LINK=/media/var/openwrt-build
BUILD=/build
export PATH="/build/source:${PATH}"
export OPENWRT_VERSION_TOTAL=19.07.0-rc1
export OPENWRT_VERSION_TOTAL_IMAGEBUILDER=${OPENWRT_VERSION_TOTAL}
export OPENWRT_DEFAULT_CDN=http://downloads.openwrt.org/releases

sudo rm -rf $BUILD_DIR_LINK
sudo rm -rf $BUILD
sudo mkdir $BUILD_DIR_LINK
sudo chown -R $USER:$USER $BUILD_DIR_LINK
sudo chown -R $USER:$USER $BUILD
sudo ln -s $BUILD_DIR_LINK $BUILD
sudo apt -y install asciidoc bash bc time bcc bin86 binutils build-essential bzip2 cmake curl default-jdk fastjar file flex gawk gcc genisoimage gettext git git-core intltool jikespg libboost-dev libgtk2.0-dev libncurses5-dev libssl-dev libusb-dev libxml-parser-perl make mc mercurial nano ncdu patch perl-modules-5.30 python python-dev quilt rsync ruby sdcc sharutils software-properties-common sshpass subversion sudo unzip util-linux wget xsltproc xz-utils zlib1g-dev g++-multilib swig python3 python3-dev help2man libelf-dev ecj java-wrappers nasm bzr libpcap-dev pwgen locales ccache

cd $BUILD
git clone https://git.openwrt.org/project/usign.git
cd /build/usign
cmake .
make
sudo cp ./usign /usr/bin/usign
sudo chmod +x /usr/bin/usign
cd /build

git clone git://git.openwrt.org/openwrt/openwrt.git source
cd /build/source
git checkout tags/v${OPENWRT_VERSION_TOTAL}
cp feeds.conf.default feeds.conf
echo 'src-git node https://github.com/nxhack/openwrt-node-packages.git' >> feeds.conf

./scripts/feeds update -a
./scripts/feeds install -a
./scripts/feeds update node
rm -rf ./package/feeds/packages/node*
./scripts/feeds install -a -p node

ln -s $DIR/build-openwrt $BUILD/host-build
ln -s $DIR/image-builder-files $BUILD/image-builder-files
ln -s $DIR/make-scripts $BUILD/make-scripts
ln -s $DIR/patches $BUILD/patches
ln -s $DIR/router $BUILD/router
ln -s $DIR/secure $BUILD/secure
cp -R $DIR/make-scripts/* $BUILD/source/
pushd /build/source
