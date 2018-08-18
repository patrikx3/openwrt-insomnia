[//]: #@corifeus-header

# ☕ ☕ OpenWrt Latest Stable with latest NodeJs, kaloz/mwlwifi's latest WIFI driver, latest Redis stable

                        
[//]: #@corifeus-header:end
## Bulding

### It is very important so that Makefile is a TAB instead 8 spaces!   

#### Help for creating patching with packages
https://openwrt.org/docs/guide-developer/use-patches-with-buildsystem   
  

### Rebuild a package
```bash
rm build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/redis* -rf || true
rm build_dir/target-mipsel_24kc_musl-1.1.16/redis* -rf || true
rm feeds/redis* -rf
./scripts/feeds update -a
./scripts/feeds install -a

# once you already updated the all
./scripts/feeds install redis
./scripts/feeds update -a -p redis

make package/feeds/redis/redis/{clean,prepare,compile} package/index V=s
```

#### Quick

```bash
rm build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/redis* -rf || true
rm build_dir/target-mipsel_24kc_musl-1.1.16/redis* -rf || true
rm feeds/redis* -rf
./scripts/feeds install redis
./scripts/feeds update -a -p redis
make package/feeds/redis/redis/{clean,prepare,compile} package/index V=s
```  
  
### To create the patch

```bash
make package/feeds/redis/redis/{clean,prepare} V=s QUILT=1

# either
cd /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/redis-4.0.2/

# or
cd /build/source/build_dir/target-mipsel_24kc_musl-1.1.16/redis-4.0.2


quilt push -a
quilt new 010-my-context.patch
quilt edit include/my_context.h  
quilt series
quilt diff
quilt refresh
```

    ### To edit a patch

```bash
make package/feeds/redis/redis/{clean,prepare} V=s QUILT=1

# either
cd /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/redis-4.0.2/

# or
cd /build/source/build_dir/target-mipsel_24kc_musl-1.1.16/redis-4.0.2


quilt series
quilt refresh
quilt push 010-redis.patch
quilt edit ./deps/jemalloc/src/pages.c 
quilt edit src/Makefile 
quilt edit src/atomicvar.h
quilt diff
quilt refresh
```

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.1.100-370 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end