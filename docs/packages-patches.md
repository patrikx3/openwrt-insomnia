[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
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


## Support Our Open-Source Project ❤️
If you appreciate our work, consider starring this repository or making a donation to support server maintenance and ongoing development. Your support means the world to us—thank you!

### Server Availability
Our server may occasionally be down, but please be patient. Typically, it will be back online within 15-30 minutes. We appreciate your understanding.

### About My Domains
All my domains, including [patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com), are developed in my spare time. While you may encounter minor errors, the sites are generally stable and fully functional.

### Versioning Policy
**Version Structure:** We follow a Major.Minor.Patch versioning scheme:
- **Major:** Corresponds to the current year.
- **Minor:** Set as 4 for releases from January to June, and 10 for July to December.
- **Patch:** Incremental, updated with each build.

**Important Changes:** Any breaking changes are prominently noted in the readme to keep you informed.

---


[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2024.4.113

 [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)






[//]: #@corifeus-footer:end
