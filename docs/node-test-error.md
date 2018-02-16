[//]: #@corifeus-header

## Latest Stable OpenWrt Version with additional packages/feeds

---
                        
[//]: #@corifeus-header:end
# Node not compile


```text
CONFIG_PACKAGE_node-ffi=m

# i think it was a connectify problem
CONFIG_PACKAGE_node-ideino-linino-lib=m
CONFIG_PACKAGE_node-xmpp=m
CONFIG_PACKAGE_node-xmpp-client=m
CONFIG_PACKAGE_node-xmpp-component=m
CONFIG_PACKAGE_node-xmpp-server=m
```

```bash
# works if you use the PKG_SOURCE ends with .tar.gz
make package/feeds/node/node-alljoyn/{clean,prepare,compile} package/index V=s

make package/feeds/node/node-ffi/{clean,prepare,compile} package/index V=s

# works if you use the PKG_SOURCE ends with .tar.gz
make package/feeds/node/node-ideino-linino-lib/{clean,prepare,compile} package/index V=s

# works if you use the PKG_SOURCE ends with .tar.gz
make package/feeds/node/node-xmpp/{clean,compile} package/index V=s
```

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.8-49 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LFRV89WPRMMVE&lc=HU&item_name=Patrik%20Laszlo&item_number=patrikx3&currency_code=HUF&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end

