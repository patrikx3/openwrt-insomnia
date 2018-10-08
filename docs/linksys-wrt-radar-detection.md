[//]: #@corifeus-header

# ☕ OpenWrt Latest Stable with latest NodeJs, kaloz/mwlwifi's latest WIFI driver, latest Redis stable

                        
[//]: #@corifeus-header:end

# DFS / Radar Detection

It works with all Linksys latest WRT (I tested WRT1900ACS v2 and WRT3200ACM).  

Based on:  
https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307984048

https://github.com/kaloz/mwlwifi/issues/280#issuecomment-370997269

## To make it work

You need to remove these:

```bash
opkg remove kmod-mwifiex-sdio

# but the best is
nano /etc/config/wireless

# remove the country
# remove the radio2 and default_redio2 sections
```

The best is:  
https://github.com/kaloz/mwlwifi/issues/185#issuecomment-367382377

## But the important, that you most likely need to setup

In the router, check the status:

```bash
iw reg get
```

Result (of course mine is good by now):
```text
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)

phy#1
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)

phy#0
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)
```

What you need to test in the WIFI is to make sure that use the same country even though you bought like in Hungary. So if **phy#1**, **phy#0** says **FR** or something else, then you need to set in your WIFI in LUCI for example at the same country!!!

It is this you have to setup based on the country above:  
[https://192.168.1.1/cgi-bin/luci/admin/network/wireless/radio0.network1](https://192.168.1.1/cgi-bin/luci/admin/network/wireless/radio0.network1])  
and  
[http://192.168.81.1/cgi-bin/luci/admin/network/wireless/radio1.network1](http://192.168.81.1/cgi-bin/luci/admin/network/wireless/radio1.network1)  

On the ```Advanced Settings``` tab, so make sure all WIFI use that! I think in Europe it is always France.

# European version

## Note for DFS of WRT3200ACM (88W8964)

All WRT3200ACM devices are programmed with device power table. Mwlwifi driver will base on region code to set country code for your device and it will not allow you to change country code. There are another wifi (phy2) on WRT3200ACM which is not mwlwifi. It will allow you to change country code. Under this case, country code setting will be conflicted and it will let DFS can't work.

There are two ways to resolve this problem or for the European version, right now, only the 2nd option works:
    
1. Please don't change country code and let mwlwifi set it for you.   
2. Remove phy2. Under this case, even though you change country code, mwlwifi will reject it. Because phy2 is not existed, country code setting won't be conflicted. To do this, run the following commands (for OpenWrt/LEDE):
    
```sh
opkg remove kmod-mwifiex-sdio
opkg remove mwifiex-sdio-firmware
reboot
```
        
The best way is let mwlwifi set country code for you in the US version router.
        
### For the European version, also requires the following, if you want 160Mhz and DTS
      
* Remove the following ```radio2``` and ```default_radio2``` section from the ```/etc/config/wireless```    
* You find out your country
  * ```iw reg get```
    * Let's say it says ```FR``` - France), then
      * Either add this option to ```radio0``` and ```radio1``` section  in the  ```/etc/config/wireless``` as ```option country 'FR'```
        * then execute ```uci commit wireless``` 
      * or via ```LUCI``` at ```/cgi-bin/luci/admin/network/wireless```, click both wireless interfaces with ```EDIT``` and the country settings is in the ```Advanced Settings``` tab, where you can set it, then just ```Save and Apply```.
* Next execute this command: ```opkg remove kmod-mwifiex-sdio mwifiex-sdio-firmware``` (sometimes you have to execute twice, not sure which should be first, but twice will work, because of the order of the dependencies )  
* Reboot  


#### Note

There will be a change in the driver as is described in:  
https://github.com/kaloz/mwlwifi/issues/280#issuecomment-370997269   
  
Once this comment is implemented, the DTS and 160 mhz will work by default (not needed to remove packages installed by LEDE by default or deal with the ```phy2``` and ```radio2```).

##### The radio0 5ghz 160 mhz channel note

160 mhz works only with channel 100 upwards, then ```mwlwifi``` auto set it up, ```auto``` is not working for now.

### For the European version, if you do not want 160Mhz and DTS

All you have to do, you can keep every packages and use only non DTS frequencies as appear below that doesn't show ```DFS```.

In that case, you can even use the ```radio2```, which must match with 80Mhz and same ```channel``` of the ```radio0```, and the max 18-21 dBm transit power (syslog shows, 18 is restricted, but I could set it to 21 dBm and it worked).

```text
country 98: DFS-UNSET
	(2402 - 2472 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 23), (0 ms), DFS
	(57240 - 63720 @ 2160), (N/A, 40), (N/A)

phy#2
country US: DFS-FCC
	(2402 - 2472 @ 40), (N/A, 30), (N/A)
	(5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
	(5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
	(5735 - 5835 @ 80), (N/A, 30), (N/A)
	(57240 - 63720 @ 2160), (N/A, 40), (N/A)

phy#1
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)

phy#0
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)
```



[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v2018.10.8-0 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end