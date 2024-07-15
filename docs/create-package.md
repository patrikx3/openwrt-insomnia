[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
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
