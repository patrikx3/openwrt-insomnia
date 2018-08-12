[//]: #@corifeus-header

# ☕ Latest Stable OpenWrt Version with additional packages/feeds

                        
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

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.97-356 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end