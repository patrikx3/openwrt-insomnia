[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
[//]: #@corifeus-header:end
# Once moving from LEDE to OpenWRT

From the file ```/etc/profile```, remove the path:

```bash
export PATH="/opt/router-scripts-lede:/usr/sbin:/usr/bin:/sbin:/bin"
```

and change it like:

```bash
export PATH="/opt/router-scripts-openwrt:/usr/sbin:/usr/bin:/sbin:/bin"
```

## LEDE-KEYRING

The ```lede-keyring``` package might change to ```openwrt-keyring```.

# Package missing


[Info](https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=393817df5d7046fadf137f9b0a363cb00551d2de)

* procd-nand (but working, probably built in now)



# Router package missing

## R-PI 3

* faad2 
* kmod-fs-exfat 
* libfaad2 
* libffmpeg-mini 
* luci-app-minidlna 
* minidlna 
* moc

# Target changed

## R-PI 3

Looks like ```arm_cortex-a53_neon-vfpv4``` is ```aarch64_cortex-a53``` now.

https://forum.lede-project.org/t/raspberrry-pi-3-b-cm-is-missing/11684/2
           
           
# Kernel

https://forum.lede-project.org/t/config-kernel-debug-fs/11692/7



```CONFIG_KERNEL_DEBUG_FS=y``` is cannot be un-checked.           




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


[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2024.10.101

 [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)






[//]: #@corifeus-footer:end
