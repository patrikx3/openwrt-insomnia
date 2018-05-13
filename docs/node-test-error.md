[//]: #@corifeus-header

# ☕ Latest Stable OpenWrt Version with additional packages/feeds

                        
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

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.65-273 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end

