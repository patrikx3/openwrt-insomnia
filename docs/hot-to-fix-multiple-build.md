[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
[//]: #@corifeus-header:end
# Fix multiple build (all is not always working)

**iw - install problem**

```bash
make package/install V=s
```

# Need to update and these:

## D-LINK 860L B1
https://downloads.openwrt.org/releases/23.05.0-rc2/targets/ramips/mt7621/config.seed (is existing in 23.05.0-rc2		)

```text
CONFIG_VERSION_CODE="insomnia"
CONFIG_KERNEL_MIPS_FPU_EMULATOR=y
CONFIG_VERSION_REPO="http://cdn.corifeus.com/openwrt/23.05.0-rc2"
CONFIG_BUILD_LOG=y
```

es hasznald ezt:
```bash
./make-d-link-dir-860l-b1
./make-d-link-dir-860l-b1-only
```

## R-PI3
https://downloads.openwrt.org/releases/23.05.0-rc2/targets/brcm2708/bcm2710/config.seed

```text
CONFIG_VERSION_REPO="http://cdn.corifeus.com/openwrt/23.05.0-rc2"
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


## Support Our Open-Source Project ❤️
If you appreciate our work, consider starring this repository or making a donation to support server maintenance and ongoing development. Your support means the world to us—thank you!

### Server Availability
Our server may occasionally be down, but please be patient. Typically, it will be back online within 15-30 minutes. We appreciate your understanding.

### About My Domains
All my domains, including [patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com), are developed in my spare time. While you may encounter minor errors, the sites are generally stable and fully functional.

### Versioning Policy
**Version Structure:** We follow a Major.Minor.Patch versioning scheme:
- **Major:** Corresponds to the current year.
- **Minor:** Set as 4 for releases from January to June, and 10 for July to December.
- **Patch:** Incremental, updated with each build.

**Important Changes:** Any breaking changes are prominently noted in the readme to keep you informed.

---


[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2024.4.113

 [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)






[//]: #@corifeus-footer:end
