[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT / D-LINK DIR 860L B1 / R-PI 3

                        
[//]: #@corifeus-header:end
# Fix multiple build (all is not always working)

**iw - install problem**

```bash
make package/install V=s
```

# Need to update and these:

## D-LINK 860L B1
https://downloads.openwrt.org/releases/18.06.3/targets/ramips/mt7621/config.seed (is existing in 18.06.3)

```text
CONFIG_VERSION_CODE="insomnia"
CONFIG_KERNEL_MIPS_FPU_EMULATOR=y
CONFIG_VERSION_REPO="http://cdn.corifeus.com/openwrt/18.06.3"
CONFIG_BUILD_LOG=y
```

es hasznald ezt:
```bash
./make-d-link-dir-860l-b1
./make-d-link-dir-860l-b1-only
```

## R-PI3
https://downloads.openwrt.org/releases/18.06.3/targets/brcm2708/bcm2710/config.seed

```text
CONFIG_VERSION_REPO="http://cdn.corifeus.com/openwrt/18.06.3"
CONFIG_VERSION_CODE="insomnia"
CONFIG_KERNEL_DEVMEM=y
CONFIG_PACKAGE_avahi-dbus-daemon=y
CONFIG_PACKAGE_dbus=y
CONFIG_PACKAGE_libavahi-client=y
CONFIG_PACKAGE_libavahi-compat-libdnssd=y
CONFIG_PACKAGE_libavahi-dbus-support=y
CONFIG_PACKAGE_libdaemon=y
CONFIG_PACKAGE_libdbus=y
CONFIG_BUILD_LOG=y
```

es hasznald ezt:
```bash
./make-rpi-3
./make-rpi-3-only
```

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v2019.4.106 

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end