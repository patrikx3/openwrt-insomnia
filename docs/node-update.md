[//]: #@corifeus-header

# ☕ OpenWrt Latest Stable with latest NodeJs, kaloz/mwlwifi's latest WIFI driver, latest Redis stable

                        
[//]: #@corifeus-header:end
# Node update

```bash
# linksys wrt
rm -rf build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/node*
rm -rf package/feeds/node*
rm -rf feeds/node* -rf
./scripts/feeds update -a
./scripts/feeds install -a

# node
./scripts/feeds update node
rm ./package/feeds/packages/node* || true
./scripts/feeds install -a -p node

# redis
./scripts/feeds update redis
./scripts/feeds install -a -p redis

#################################################
#################################################
#################################################
# configs
cp -avr /build/router/dir-860l-b1/source/. /build/source
cp -avr /build/router/linksys-wrt1900acs/source/. /build/source
cp -avr /build/router/linksys-wrt3200acm/source/. /build/source


# FINAL
cp -R /build/make-scripts/* /build/source

```
[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v2018.12.30-1 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end