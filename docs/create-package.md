[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
[//]: #@corifeus-header:end

# Create packages

## For starting, I was using these URL's for NodeJs packages

https://github.com/nxhack/openwrt-node-packages  
https://github.com/nxhack/openwrt-node-packages/issues/15

# Create a Docker image:  

```bash
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
* Target Profile
  * Linksys 1900ACS v2 => Linksys WRT1900ACS
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
sed -i.bak 's#http://downloads.openwrt.org/releases/23.05.0-rc2	#http://cdn.corifeus.com/openwrt/23.05.0-rc2		#g' .config
sed -i.bak 's#http://downloads.openwrt.org/releases/23.05.0-rc2	#http://cdn.corifeus.com/openwrt/23.05.0-rc2		#g' package/base-files/image-config.in
sed -i.bak 's#default "/usr/sbin#default "/opt/router-scripts-openwrt:/usr/sbin#g' package/base-files/image-config.in
echo "CONFIG_VERSION_REPO=\"http://cdn.corifeus.com/openwrt/23.05.0-rc2\"" >> .config
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

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2023.10.112

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end
