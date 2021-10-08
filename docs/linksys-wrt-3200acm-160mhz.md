[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
[//]: #@corifeus-header:end

# Linksys WRT 3200ACM 160Mhz

You have to find out the channel that in your country was setup with the router is working.
For me, I am Hungarian, but the router is FR based in FRANCE in EUROPE (or European Linksys is usually is FR), the ```100, 120 channel``` is working well, I think upwards channels ```100```.

But for now, it is using the ```radar detection``` and it is changing the channels and it works.

## Check status

```bash
iw reg get
iw dev
```

## Picture

Though I set 160Mhz, but my clients only know 80Mhz right now, but with the settings, it still works, so 160Mhz is working:

![Linksys-3200ACM-160Mhz](https://cdn.corifeus.com/git/openwrt-insomnia/artifacts/images/Linksys-3200ACM-160Mhz.png "Linksys-3200ACM-160Mhz") 

## This is important

http://192.168.1.1/cgi-bin/luci/admin/network/wireless/radio0.network1

Below:
```Wireless scurity``` set ```Cipher``` to ```Force CCMP (AES)```.

```bash
reboot && exit
```
or just ```Save and Apply``` in ```LUCI```.

# More info

https://github.com/kaloz/mwlwifi/blob/417c15f2af00920945882a1b82ab1f5785a7b7b0/README.md#note-for-dfs-of-wrt3200acm-88w8964

[//]: #@corifeus-footer

---

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2021.10.118

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end
