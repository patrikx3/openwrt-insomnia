[//]: #@corifeus-header

 

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://paypal.me/patrikx3) [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Corifeus @ Facebook](https://img.shields.io/badge/Facebook-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)   [![Build Status](https://github.com/patrikx3/openwrt-insomnia/workflows/build/badge.svg)](https://github.com/patrikx3/openwrt-insomnia/actions?query=workflow%3Abuild)
[![Uptime Robot ratio (30 days)](https://img.shields.io/uptimerobot/ratio/m780749701-41bcade28c1ea8154eda7cca.svg)](https://stats.uptimerobot.com/9ggnzcWrw)

# ☕ OpenWrt with latest NodeJs for Linksys WRT




                        
[//]: #@corifeus-header:end

# Info
  
To see the firmwares, see:  
https://cdn.corifeus.com/openwrt

---
  
Nota bene: https://openwrt.org/releases/23.05/notes-23.05.0-rc2#switch_from_wolfssl_to_mbedtls_as_default
  
---
  
The main reason is to be able to use the latest NodeJs for Linksys WRT (the default NodeJs is old) and the crypto accelerator. 

  
Also, a docker container with all the firmwares and packages are in `/build/source/bin` @  
https://hub.docker.com/r/patrikx3/openwrt-insomnia  
  
## Crypto accelerator

Since OpenWrt 19, the crypto accelerator is enabled by default. 
  
https://openwrt.org/docs/techref/hardware/cryptographic.hardware.accelerators
    
### You can verify 

Not enabled:  
```text
root@hawk:~# openssl engine -t -c
(dynamic) Dynamic engine loading support
     [ unavailable ]
```

Enabled:  
```text
root@hawk:~# openssl engine -t -c
(dynamic) Dynamic engine loading support
     [ unavailable ]
(devcrypto) /dev/crypto engine
 [DES-CBC, DES-EDE3-CBC, AES-128-CBC, AES-192-CBC, AES-256-CBC, AES-128-ECB, AES-192-ECB, AES-256-ECB]
     [ available ]
```

## UPnP
I could only install it with `opkg install miniupnpd-nftables luci-app-upnp`.

For `/etc/config/upnpd`, we better to enable and setup these options:

```txt
config upnpd 'config'
	option enabled '1'
	option external_iface 'wan'
	option internal_iface 'lan'
```


## European version

If you have a 3rd Radio and you have the European version of WRT and have a 3rd radio, to get it to work on DFS/Radar, create this file:
```text
/etc/modules.d/mwifiex
``` 

with this content:
```text
mwifiex reg_alpha2=FR
```

Then, set all radio 1 and 2 to be FR as well and the DTS/Radar perfectly works. 

## Packages

**There are over 9000 packages built for Linksys WRT.**

<!--
* Enabled Apache HTTP2
-->
* Enabled NGINX HTTP2
* NodeJs latest version and many pre-built packages (including binaries)

See what is in [create from scratch](docs/create-from-scratch.md).


<!--
# NodeJs Homebridge and homekit settings is enabled by default based on
https://github.com/nxhack/openwrt-node-packages#note-about-avahi-and-homebridge
-->

# Routers pre-built

If you want to install right away with LUCI:
https://cdn.corifeus.com/openwrt/

## The release



<!--
* D-Link DIR-860l B1 
  * https://cdn.corifeus.com/openwrt/23.05.0-rc2/targets/ramips/mt7621/
    * If it is not working, with D-Link DIR-860l B1, you have to reset the router and re-load the firmware via emergency upload, like this
      1. Plug the Ethernet cable that connects your computer, that was plugged into one of the LAN ports, 
      1. Setup your PC with static IP - ex: 192.168.0.2 (different from 192.168.0.1), the gateway is 192.168.0.1, netmask 255.255.255.0
      1. Make sure the PC has the new firmware 
      1. Turn off the router
      1. Hold the reset button (in the bottom, there is a small whole for like a needle, it says RESET).
      1. Turn on the router and wait for like 3-5 seconds, the orange will flash, like turning off.
      1. Open a web browser to 192.168.0.1 and then you should see EMERGENCY FLASHING page then click browse/upload locate the file and click UPLOAD FIRMWARE NOW.
      1. For me, for first upload it doesn't do anything, I just click UPLOAD again and then it start uploading.
      1. You should see a SUCCSESS page, 
      1. You will have to wait until like 150 seconds.
      1. When it is green, you can turn off the static settings for the ethernet and enable DHCP.
      1. The you can open with 192.168.1.1, no password at all, you got LUCI and SSH as well.
      1. It works for sure, it's not like Linksys WRT, that you need an USB-TTL cable…

* RPI-3
  * https://cdn.corifeus.com/openwrt/ or specific version eg. https://cdn.corifeus.com/openwrt/23.05.0-rc2		/targets/brcm2708/bcm2710/
  * I don't have a RPI-3 in my hand, so I cannot test it, but a dude asked to build this, so he uses it.

-->

## If you want some of the packages

```text
/cgi-bin/luci/admin/system/packages/ipkg
```

### Linksys WRT or compatible alike mvebu / arm 9 (arm_cortex-a9_vfpv3-d16)

What is very useful is (many NodeJs built packages as well as binary builds):
```text
src/gz openwrt_node http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/arm_cortex-a9_vfpv3-d16/node
```

The rest, you can find on OpenWrt as well, so you do not need it:
```text
src/gz openwrt_core http://cdn.corifeus.com/openwrt/23.05.0-rc2/targets/mvebu/cortexa9/packages
src/gz openwrt_base http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/arm_cortex-a9_vfpv3-d16/base
src/gz openwrt_luci http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/arm_cortex-a9_vfpv3-d16/luci
src/gz openwrt_packages http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/arm_cortex-a9_vfpv3-d16/packages
src/gz openwrt_routing http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/arm_cortex-a9_vfpv3-d16/routing
src/gz openwrt_telephony http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/arm_cortex-a9_vfpv3-d16/telephony
```

<!--
### D-LINK DIR 860L B1

What is very useful is (many NodeJs built packages as well as binary builds):
```text
src/gz openwrt_node http://cdn.corifeus.com/openwrt/23.05.0-rc2	/packages/mipsel_24kc/node
```

The rest, you can find on OpenWrt as well, so you do not need it:
```text
src/gz openwrt_core http://cdn.corifeus.com/openwrt/23.05.0-rc2/targets/ramips/mt7621/packages
src/gz openwrt_base http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/mipsel_24kc/base
src/gz openwrt_luci http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/mipsel_24kc/luci
src/gz openwrt_packages http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/mipsel_24kc/packages
src/gz openwrt_routing http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/mipsel_24kc/routing
src/gz openwrt_telephony http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/mipsel_24kc/telephony
```

### R-PI 3 or compatible arm (aarch64_cortex-a53)

What is very useful is (many NodeJs built packages as well as binary builds):
```text
src/gz openwrt_node http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/aarch64_cortex-a53/node
```

The rest, you can find on OpenWrt as well, so you do not need it:
```text
src/gz openwrt_core http://cdn.corifeus.com/openwrt/23.05.0-rc2/targets/brcm2708/bcm2710/packages
src/gz openwrt_base http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/aarch64_cortex-a53/base
src/gz openwrt_luci http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/aarch64_cortex-a53/luci
src/gz openwrt_packages http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/aarch64_cortex-a53/packages
src/gz openwrt_routing http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/aarch64_cortex-a53/routing
src/gz openwrt_telephony http://cdn.corifeus.com/openwrt/23.05.0-rc2/packages/aarch64_cortex-a53/telephony
```
-->

# Signatures

## If you do not want to have the hassle, there are multiple solutions below.

If you use an ```insomnia``` firmware, then you are done, but if you want one or more feeds from a non ```insomnia``` firmware, your router still needs a verified signature.

### If you just use one or a few feeds non insomnia firmware, your router needs a signature

You can enable foreign keys from this directory:  
https://github.com/patrikx3/openwrt-insomnia/tree/master/image-builder-files/etc/opkg/keys to    
```text
 /etc/opkg/keys
```

#### Warning
If you see something like `untrusted comment: OpenWrt usign key of Patrik Laszlo / patrikx3` as it says, you do not have to be afraid. It means, that the comment itself is not verified. 

### Option 2

The easiest solution I know is via LUCI :  
[http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg](http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg)    
  
In the **Configuration** tab, comment like this:  
```#option check_signature 1```

### Option 3 manual with SSH
  
You can also set it up via SSH as:
```text
root@digi:~# cat /etc/opkg.conf
dest root /
dest ram /tmp
lists_dir ext /var/opkg-lists
option overlay_root /overlay
#option check_signature 1
```  

Just edit there, ```nano``` is installed, just comment the ```option check_signature 1``` as it shows above.
  
  
  
<!--

### Generate real signatures, do not need ```#option check_signature 1``` 

Everything is verified.

I have my own GPG and USIGN. So the [http://cdn.corifues.com/openwrt](http://cdn.corifues.com/openwrt) it works with signatures by now.

But if you want to build your own firwmare based on ```insomnia```, you need to create your own GPG and USIGN, you can generate like this:  
https://openwrt-project.org/docs/user-guide/keygen
 
A few small info is here [info](docs/openwrt-generate-gpg-and-usign.md).
 
So to build with ```insomnia``` you need to place some files like above. 
 
The ```openwrt-insomnia/image-builder-files/etc/opkg/keys/xxxxxxx``` is your USIGN actual public.key with the hash name, it builds into the firmware, the description in the link just above coming right away, says how to generate that file.    
The ``openwrt-insomnia/secure/gpg/secret-signing-key.pgp`` and ```secure/usign``` needs the ```public.key``` and ```secret.key```. 
You also need to add in ```openwrt-insomnia/secure/passphrase.txt```, which is your GPG passphrase. If this is added in, you can sign everything.

Right now, it is not found to automatic use the passphrase for ```gpg```, so you have to type it in for the passphrase.

Before it asks for the passphrase, it will show on the terminal so you copy and then just paste it. It will as twice.

They files to generate are in the same link above. So, if you want to sign, you might need to contact to me.

![GPG and USIGN structure in the repo](artifacts/images/gpg-and-usign.png "GPG and USIGN structure in the repo") 

If you have this signed gpg and usign data and keys, I can help you to signed firmwares and packages.

-->

## Ext-root issue

Based on the OpenWrt forum discussions, after sysupgrade, the ext-root has to be re-built, no other solution.

## Wifi and WPS Issue

[WPS](docs/wps.md) info.

## Upgrade errors

* Linksys WRT1900ACS / Linksys WRT3200ACM / Linksys WRT32X
    * For Linksys the firmwares that start with ```insomnia``` worth trying, because you can use latest NodeJs.
    * https://cdn.corifeus.com/openwrt/ or specific version eg. https://cdn.corifeus.com/openwrt/23.05.0-rc2/targets/mvebu/cortexa9/
        * If you get the error ```The uploaded image file does not contain a supported format. Make sure that you choose the generic image format for your platform.```, you have to do it via SSH with ```sysupgrade -F FIRMWARE```, then it works.
        * If you have a bricked firmware, you need a USB-TTL. [Linksys USB-TTL](docs/linksys-usb-ttl.md).
        * Error code: 18005
            * When trying to install a firmware image, I get the following error:
                * Error code: 18005, Upgrade unsuccessfully because the version of the upgraded file was incorrect. Please check the file name.
            * Solution: Rename the firmware image to something short, like e.g. factory.bin
                * Based on
                  https://openwrt.org/faq/before_installation#error_code18005

## Docker

### Requirements

**Docker CE**

For your workstation, you don't really NodeJs, but GitHub actions and auto generated websites are required...   
   
This is a OpenWrt Docker builder and a living Docker repo as well, ready to build, a lot already built.
(A big image / full firmware, the most important packages are built. Ready to use.)  

#### Changing the firmware pre-built, so the build will be fast!!!

All the latest stable OpenWrt versions.

* docker pull patrikx3/openwrt-insomnia:linksys-wrt

<!--
* docker pull patrikx3/openwrt-insomnia:d-link-dir-860l-b1
* docker pull patrikx3/openwrt-insomnia:rpi-3
-->

* RAW
  * docker pull patrikx3/openwrt-insomnia:latest

You run them, but these here, the built is in: http://cdn.corifeus.com/openwrt/23.05.0-rc2, all the built packages and firmwares in ```/build/source/bin```, you move to a host, install the firmware and you are done, because in the ```insomnia``` firmwares there is a lot in, but this is the default, so you need to change your own hostname here:
[http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg](http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg) at ```Configuration``` tab. If you do not want to build at all you can choose to your host  

All built packages and firmwares including the ```insomnia``` firmwares are in ```/build/source/bin```. 

[README about how I build the firmwares in order](docs/template-docker-commit.md)

# My repos    
   
https://hub.docker.com/r/patrikx3/openwrt-insomnia/tags/

https://cdn.corifeus.com/openwrt/  

# Linksys WRT Radar Detection
Tested on WRT1900ACSv2 and WRT3200ACM, works.  
[README](docs/linksys-wrt-radar-detection.md)

# Ext-Root
[README](docs/ext-root.md)

## How I built these Dockers via these links
[README](docs/links-i-used.md)

## Docker commands
[README](docs/docker-commands.md)

## Create packages, not neeed anymore
[My first package](docs/create-package.md)

# Create from scratch
[README](docs/create-from-scratch.md)


# Copy configs
[README](docs/copy-test-configs.md)


# Firmware sizes
[README](docs/firmware-sizes.md)

# WPS
[README](docs/wps.md)

# Packages and patches

[README](docs/packages-patches.md)

# Linksys WRT 3200ACM 160 Mhz
[README](docs/linksys-wrt-3200acm-160mhz.md)

# Linksys USB-TTL
[README](docs/linksys-usb-ttl.md)

# Linksys WRT 3200ACM / WRT32X
For some reason it needs this:

```bash
# based on this https://truica-victor.com/dhcp-packet-received-eth0-2-address/
echo "except-interface=eth1.2" >> /etc/dnsmasq.conf
```

[//]: #@corifeus-footer

---

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2022.4.118

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end


