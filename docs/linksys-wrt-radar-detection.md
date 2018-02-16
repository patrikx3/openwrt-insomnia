[//]: #@corifeus-header

## Latest Stable OpenWrt Version with additional packages/feeds

---
                        
[//]: #@corifeus-header:end
# DFS / Radar Detection

It works with all Linksys latest WRT (I tested WRT1900ACS v2 and WRT3200ACM).  

Based on:  
https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307984048

## To make it work

You need to remove these **(unless you use ```openwrt-insomnia```, because it is pre-removed)**:

```bash
opkg remove mwifiex-sdio-firmware kmod-mwifiex-sdio
```

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

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.8-49 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LFRV89WPRMMVE&lc=HU&item_name=Patrik%20Laszlo&item_number=patrikx3&currency_code=HUF&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end