[//]: #@corifeus-header

## Latest Stable OpenWrt Version with additional packages/feeds

---
                        
[//]: #@corifeus-header:end
## Bulding

### It is very important so that Makefile is a TAB instead 8 spaces!   

#### Help for creating patching with packages
https://openwrt.org/docs/guide-developer/use-patches-with-buildsystem   
  

### Rebuild a package
```bash
rm build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/mariadb* -rf || true
rm build_dir/target-mipsel_24kc_musl-1.1.16/mariadb* -rf || true
rm feeds/mariadb* -rf
./scripts/feeds update -a
./scripts/feeds install -a

# once you already updated the all
./scripts/feeds install mariadb
./scripts/feeds update -a -p mariadb

make package/feeds/mariadb/mariadb/{clean,prepare,compile} package/index V=s
```

#### Quick

```bash
rm build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/mariadb* -rf || true
rm build_dir/target-mipsel_24kc_musl-1.1.16/mariadb* -rf || true
rm feeds/mariadb* -rf
./scripts/feeds install mariadb
./scripts/feeds update -a -p mariadb
make package/feeds/mariadb/mariadb/{clean,prepare,compile} package/index V=s
```  
  
### To create the patch

```bash
make package/feeds/mariadb/mariadb/{clean,prepare} V=s QUILT=1

# either
cd /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/mariadb-4.0.2/

# or
cd /build/source/build_dir/target-mipsel_24kc_musl-1.1.16/mariadb-4.0.2


quilt push -a
quilt new 010-my-context.patch
quilt edit include/my_context.h  
quilt series
quilt diff
quilt refresh
```

    ### To edit a patch

```bash
make package/feeds/mariadb/mariadb/{clean,prepare} V=s QUILT=1

# either
cd /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/mariadb-4.0.2/

# or
cd /build/source/build_dir/target-mipsel_24kc_musl-1.1.16/mariadb-4.0.2


quilt series
quilt refresh
quilt push 010-mariadb.patch
quilt edit ./deps/jemalloc/src/pages.c 
quilt edit src/Makefile 
quilt edit src/atomicvar.h
quilt diff
quilt refresh
```

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.12-94 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end