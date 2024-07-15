[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
[//]: #@corifeus-header:end
# WPS

https://openwrt.org/docs/user-guide/wifi_configuration#wps_options

https://forum.openwrt.org/t/how-to-use-wps-on-linksys-wrt/165148

There were some changes. So this is how it works with ```23.05.0-rc2```.

Minimal steps needed to get WPS running:

In ```/etc/config/wireless``` it is important in the ```wifi-iface```only in the 2.4 GHZ.

```text
    option wps_pushbutton '1'
```

But you can do it with ```LUCI``` as well.

```bash
opkg update

# if you remove it, it will not work
# v22
opkg remove wpad-basic-wolfssl
# v23
opkg remove wpad-basic-mbedtls

# it will start working after re-install
# v22
opkg install wpad-wolfssl hostapd-utils
# v23
opkg install wpad-mbedtls hostapd-utils

reboot && exit

# v22
hostapd_cli -i wlan1 wps_pbc
# or v23
hostapd_cli wps_pbc
# or v23
hostapd_cli -i phy1-ap0 wps_pbc


# v22 or
hostapd_cli -i wlan1 wps_pin any $PIN
# v23 or
hostapd_cli wps_pin any $PIN
# v23 or
hostapd_cli -i phy1-ap0 wps_pin any $PIN

# /var/run/hostapd-phy1.conf???
```

# Debug (not needed)

```bash
reboot && exit

# regenerate the wifi interface
rm -f /etc/config/wireless
wifi config

iw reg get
iw dev
```


## Actual Linksys 3200ACM WPS

Do what it says above. Then on router on the bottom right there is the WPS button. Click for like 3 seconds or more and it will work.

### Example

```text
config wifi-iface 'default_radio1'
	option device 'radio1'
	option network 'lan'
	option mode 'ap'
	option ssid 'your-ssid'
	option key 'your-secret'
	option encryption 'psk2+ccmp'
	option wps_pushbutton '1'

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
