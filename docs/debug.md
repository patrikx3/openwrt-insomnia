[//]: #@corifeus-header

# ☕ OpenWrt Latest Stable with latest NodeJs, kaloz/mwlwifi's latest WIFI driver, latest Redis stable

                        
[//]: #@corifeus-header:end
# DEBUG DEBUG DEBUG

```bash
# this is the good
find -iname '*kmod-mwlwifi*'

# these are all wrong :/
find -iname '*iwlwifi*'
find -iname '*iwlwifi*' -exec rm -rf {} +
find -iname '*kmod-iwlwifi*'
rm /build/source/staging_dir/packages/mvebu/kmod-iwlwifi_4.4.71+2017.01.41-2_arm_cortex-a9_vfpv3.ipk
rm /build/source/bin/targets/mvebu/cortexa9/packages/kmod-iwlwifi_4.4.71+2017.01.41-2_arm_cortex-a9_vfpv3.ipk
rm /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/openwrt-imagebuilder-17.01.4-mvebu.Linux-x86_64/packages/kmod-iwlwifi_4.4.71+2017.01.41-2_arm_cortex-a9_vfpv3.ipk
make clean
make dirclean # remove the toolchain as well 
make package/kernel/mwlwifi/{clean,prepare,compile}
```

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v2018.11.17-2 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end