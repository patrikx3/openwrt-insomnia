#
# Copyright (C) 2014-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mwlwifi
PKG_VERSION:=10.3.4.0.git-2018-02-09
PKG_RELEASE=1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE


# it actually Eduperez's numbers and versions are showing always even though I re-written, this is only the ipk name.
# cat /sys/kernel/debug/ieee80211/phy1/mwlwifi/info && cat /sys/kernel/debug/ieee80211/phy0/mwlwifi/info
# ll /rom/lib/firmware/mwlwifi/ && ll /lib/firmware/mwlwifi/
# have to keep in PKG_MIRROR_HASH
# cp -avr /build/patches/source /build
# make package/kernel/mwlwifi/download V=s
# make package/kernel/mwlwifi/check FIXUP=1 V=s
# cat package/kernel/mwlwifi/Makefile | less
PKG_SOURCE_URL:=https://github.com/eduperez/mwlwifi_LEDE
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=c099f855bc231a22f85241c9878384e091fa3c53
PKG_MIRROR_HASH:=6f9d8b26926f0aa14c46d54afd86fd14af3ab0fb9544ab1b8a18a1c6fa7f0e4d

PKG_MAINTAINER:=Imre Kaloz <kaloz@openwrt.org> and Eduardo Perez and Patrik Laszlo <alabard@gmail.com>
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/mwlwifi
  SUBMENU:=Wireless Drivers
  TITLE:=Marvell 88W8864 wireless driver
  DEPENDS:=+kmod-mac80211 +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT +@DRIVER_11W_SUPPORT @PCI_SUPPORT @TARGET_mvebu
  FILES:=$(PKG_BUILD_DIR)/mwlwifi.ko
  AUTOLOAD:=$(call AutoLoad,50,mac80211 mwlwifi)
endef

NOSTDINC_FLAGS = \
	-I$(PKG_BUILD_DIR) \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-include backport/backport.h

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef

define KernelPackage/mwlwifi/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DIR) $(1)/lib/firmware/mwlwifi
	$(CP) $(PKG_BUILD_DIR)/bin/firmware/88W8864.bin $(1)/lib/firmware/mwlwifi/
	$(CP) $(PKG_BUILD_DIR)/bin/firmware/88W8897.bin $(1)/lib/firmware/mwlwifi/
	$(CP) $(PKG_BUILD_DIR)/bin/firmware/88W8964.bin $(1)/lib/firmware/mwlwifi/
	$(CP) $(PKG_BUILD_DIR)/bin/firmware/Marvell_license.txt $(1)/lib/firmware/mwlwifi/
endef

$(eval $(call KernelPackage,mwlwifi))
