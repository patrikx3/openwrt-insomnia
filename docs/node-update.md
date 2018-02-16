[//]: #@corifeus-header

## Latest Stable OpenWrt Version with additional packages/feeds

---
                        
[//]: #@corifeus-header:end
# Node update

```bash
# d-link dir 860l b1
rm -rf build_dir/target-mipsel_24kc_musl-1.1.16/node*  
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

# mariadb
./scripts/feeds update mariadb
./scripts/feeds install -a -p mariadb


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

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.8-49 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LFRV89WPRMMVE&lc=HU&item_name=Patrik%20Laszlo&item_number=patrikx3&currency_code=HUF&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end