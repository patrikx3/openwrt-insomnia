[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
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
quilt new 010-redis.patch
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
quilt edit deps/jemalloc/src/background_thread.c 
quilt diff
quilt refresh
```

[//]: #@corifeus-footer

---

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2020.10.107

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end
