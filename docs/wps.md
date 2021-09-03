[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
[//]: #@corifeus-header:end
# WPS

https://openwrt.org/docs/user-guide/wifi_configuration#wps_options

It is only working, if only these are built in the firmware: ```hostapd-common wpad-mini```, nothing other like that. If not, it will not work.

There were some changes. So this is how it works with ```21.02.0-rc4```.

Minimal steps needed to get WPS running:

In ```/etc/config/wireless``` it is important in the ```wifi-iface```only in the 2.4 GHZ.

```text
    option wps_pushbutton '1'
```

But you can do it with ```LUCI``` as well.

```bash
opkg update
opkg remove wpad-mini wpad-basic
# if you remove it, it will not work
opkg install wpad hostapd-utils
reboot && exit

# wait about 2 minutes
hostapd_cli -i wlan1 wps_pbc

hostapd_cli wps_pin any $PIN
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

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2021.10.104

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end
