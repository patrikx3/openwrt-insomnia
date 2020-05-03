[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
[//]: #@corifeus-header:end

# Start

By now, the whole build system is automated. This is just for historical documentary.

# First save the existing packages

* SSH into the router

```bash
# this is my own script but you can get the installed packages with some hacking
# this is good if you want your own firmware
# that builds all packages you now have 
opkg list-installed > opkg-list-installed.txt
```

<!--
* mc
  * via Midnight Commander you add to your repo via shell patrikx3@192.168.1.30/home/patrikx3/Projects/patrikx3/p3x/openwrt-insomnia/router/{router-name}
* Copy the opkg-list-installed.txt file to {router-name}/opkg-list-installed.txt as well
-->

# Make the raw firmware

By now, it is using faster with the helpers above, but below you can do it by hand to change everything easy.

# Build All packages

You start with:
```bash
./build-docker
```

Make sure you know there are already build docker images, so you don't really need it.

The same, if you have a server instead ```cdn.corifeus.com```, you can change it at wish.

There is a newer ```mwlwifi``` faster, newer package, they are in ```openwrt-insomnia/patches```, you can copy them safely into the ```/build/source```. 


* Target System  
  * Marvell Armada EBU Armada => Linksys WRT Multiple
  * D-Link DIR-860l B1 => MediaTek Ralink MIPS
  * Broadcom BCM27xx => RPI 3  
  
* Subtarget
  * Marvell Armada 37x/38x/XP => Linksys WRT Multiple
  * D-Link DIR-860l B1 => MT7621 
  * BCM2710 64bit based boards => RPI 3 
  
* Target Profile  
  * Multiple devices => Linksys WRT Multiple
  * D-Link DIR-860l B1 => MT7621
  * Raspberrry Pi 3B => RPI 3   

* Target Devices (for now is only Linksys WRT Multiple)
  * Enable all profiles by default 
  * THIS IS PROBABLY IMPORTANT -> Use a per-device root filesystem that add profile packages  

     
* Global build settings
  * Select all target specific packages by default
  * THIS MIGHT NOT NEEDED -> Select all kernel module packages by default
  * Select all userspace packages by default
  * EXPERIMENTAL, not using it anymore -> Set build defaults for automatic builds
  * EXPERIMENTAL, not using it anymore -> UNCHECK Collect kernel debug information
  * Kernel build options
    * Compile the kernel with MIPS FPU Emulator
      * ONLY For D-Link DIR860L B1

* Advanced configuration options
  * Enable log files during build process
  
* Build the OpenWrt Image Build
  * Include package repositories
  
* Image configuration - ENTER
  * Version configuration options - ENTER
    * Release version code
      * insomnia    
  * Seperate feed repositories
    * select
            
* Languages
  * Node.js
    * node
      * Configuration
        * Version Selection
          * 12.x
    * SELECT ALL

* Libraries
  * libavahi-compat-libdnssd (*)  
    * ONLY FOR R-PI3        

* Network
  * Web Servers/Proxies
    * apache
      * Configuration
        * Enable HTTP2
    * nginx
        * select all CONFIGURATION
          * check all
        
    
* Utililties
  * mc --->
    * Configuration
      * enable internal editor UNCHECK
      
* Exit
* YES

Copy the .config file to {router-name}/source/.config

# In an another terminal you can increase the buidling 

```bash
# for me using multiple cores the main build I always get errors, so I always use just 1 core
# I do this instead
# find out the PID
watch 'ps -aux | grep "make\|m4\|cc1"'
# end just to do this
sudo renice -20 -u 1000
# for docker I also added renice, I checked out the dockerd pid and I added in
ps -aux | grep dockerd
# you get the PID
sudo renice -20 10728 # this was the dockerd PID
```


[//]: #@corifeus-footer

---

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2020.4.135

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end
