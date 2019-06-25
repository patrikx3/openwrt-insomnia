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
