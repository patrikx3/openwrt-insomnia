[//]: #@corifeus-header

## Latest Stable OpenWrt Version with additional packages/feeds

---
                        
[//]: #@corifeus-header:end
# Kernel

#### ```CONFIG_IMG_MDC_DMA=y```

```bash
cp -avr /build/router/dir-860l-b1/source/. /build/source
./scripts/diffconfig.sh
grep -r "IMG_MDC_DMA" /build/source
```

Disable IMG_MDC_DMA.

Should look like this:
```text
docker@8b705d1661b2:/build/source$ grep -r "IMG_MDC_DMA" /build/source
/build/source/target/linux/ramips/mt7621/config-4.4:CONFIG_IMG_MDC_DMA=y
/build/source/tmp/.kconfig-ramips_mt7621:CONFIG_IMG_MDC_DMA=n
```

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.2-14 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LFRV89WPRMMVE&lc=HU&item_name=Patrik%20Laszlo&item_number=patrikx3&currency_code=HUF&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end