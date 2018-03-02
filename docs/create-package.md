[//]: #@corifeus-header

## Latest Stable OpenWrt Version with additional packages/feeds

---
                        
[//]: #@corifeus-header:end

# Create packages

## For starting, I was using these URL's for NodeJs packages

https://github.com/nxhack/openwrt-node-packages  
https://github.com/nxhack/openwrt-node-packages/issues/15

# Create a Docker image:  

```
./build-docker
```

## Before you create(s) the new same package(s), uninstall the current package(s)! 
Like ```opkg remove node```, ```opkg remove node-npm``` and then ```opkg install node_v8.2.1.ipk``` etc ... !!!!


## Start

```bash
./run
make -j9 menuconfig
```

* Target System
*   Linksys 1900ACS v2 => Marvell Armada 37x/38x/XP
*   D-Link DIR 860L B1 => MediaTek Ralink MIPS 
* Target Profile
  * Linksys 1900ACS v2 => Linksys WRT1900ACS
  * D-Link DIR 860L B1 =>MT7621
* The Languages 
  *  Node.js, Select as M (module) 
    * Below this => Configuration => Select Version 8.x
  * node-npm, Select as M (module)
* Save
* Exit all

### Note

If your target machine is MIPS and there is no hardware FPU, you need MIPS_FPU_EMULATOR checked (see if there is fpuemustats in the /sys/kernel/debug/mips directory).

### Then you need first

```bash
make menuconfig
```

* Global build settings
  * Kernel build options
    * Compile the kernel with MIPS FPU
* Save  
* Exit  

```bash
sed -i.bak 's#CONFIG_TARGET_INIT_PATH="#CONFIG_TARGET_INIT_PATH="/opt/router-scripts-openwrt:#g' .config
sed -i.bak 's#http://downloads.lede-project.org/snapshots#http://cdn.corifeus.com/openwrt/SNAPSHOT#g' .config
sed -i.bak 's#http://downloads.lede-project.org/snapshots#http://cdn.corifeus.com/openwrt/SNAPSHOT#g' package/base-files/image-config.in
sed -i.bak 's#default "/usr/sbin#default "/opt/router-scripts-openwrt:/usr/sbin#g' package/base-files/image-config.in
echo "CONFIG_VERSION_REPO=\"http://cdn.corifeus.com/openwrt/SNAPSHOT\"" >> .config
cat package/base-files/image-config.in | grep default
cat .config | grep CONFIG_VERSION_REPO
cat .config | grep CONFIG_TARGET_INIT_PATH 

# -jX is the number of threads of you CPU, I got 8
make -j9
# if error
make -j1 V=s
```
[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.14-120 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end