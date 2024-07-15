[//]: #@corifeus-header

 [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://paypal.me/patrikx3) [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Corifeus @ Facebook](https://img.shields.io/badge/Facebook-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)   [![Uptime Robot ratio (30 days)](https://img.shields.io/uptimerobot/ratio/m780749701-41bcade28c1ea8154eda7cca.svg)](https://stats.uptimerobot.com/9ggnzcWrw)

# ☕ OpenWrt Insomnia for Linksys WRT




                        
[//]: #@corifeus-header:end

# Info
  

I do not build the firmwares from scratch anymore, I am using the image builder. 
To build the firmwares:
```bash
./init-firmware.sh
```

---
  
Nota bene: [switch_from_wolfssl_to_mbedtls_as_default](https://openwrt.org/releases/23.05/notes-23.05.0-rc2#switch_from_wolfssl_to_mbedtls_as_default)
  
---
  
The main reason is to be able to use the latest NodeJs for Linksys WRT (the default NodeJs is old) and the crypto accelerator. 

  
  

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

<!--
* Enabled Apache HTTP2
-->


<!--
# NodeJs Homebridge and homekit settings is enabled by default based on
https://github.com/nxhack/openwrt-node-packages#note-about-avahi-and-homebridge
-->


# Ext-Root
[README](docs/ext-root.md)

# Wireguard
[README](docs/wireguard.md)


# WPS
[README](docs/wps.md)

## How I built these Dockers via these links
[README](docs/links-i-used.md)

## Docker commands
[README](docs/docker-commands.md)

## Create packages, not neeed anymore
[My first package](docs/create-package.md)

# Create from scratch
[README](docs/create-from-scratch.md)

# Linksys WRT Radar Detection
Tested on WRT1900ACSv2 and WRT3200ACM, works.  
[README](docs/linksys-wrt-radar-detection.md)

# Copy configs
[README](docs/copy-test-configs.md)

# Firmware sizes
[README](docs/firmware-sizes.md)

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


