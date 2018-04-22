[//]: #@corifeus-header

# ☕ Latest Stable OpenWrt Version with additional packages/feeds

                        
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

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.49-245 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end