[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
[//]: #@corifeus-header:end
# DEBUG DEBUG DEBUG

```bash
# this is the good
find -iname '*kmod-mwlwifi*'

# these are all wrong :/
find -iname '*iwlwifi*'
find -iname '*iwlwifi*' -exec rm -rf {} +
find -iname '*kmod-iwlwifi*'
rm /build/source/staging_dir/packages/mvebu/kmod-iwlwifi_4.4.71+2017.01.41-2_arm_cortex-a9_vfpv3-d16.ipk
rm /build/source/bin/targets/mvebu/cortexa9/packages/kmod-iwlwifi_4.4.71+2017.01.41-2_arm_cortex-a9_vfpv3-d16.ipk
rm /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/openwrt-imagebuilder-17.01.4-mvebu.Linux-x86_64/packages/kmod-iwlwifi_4.4.71+2017.01.41-2_arm_cortex-a9_vfpv3-d16.ipk
make clean
make dirclean # remove the toolchain as well 
make package/kernel/mwlwifi/{clean,prepare,compile}
```


# HDD Problem

Possible move to USB2 port.

```bash
cat /var/log/syslog | grep "blk_partition_remap: fail for partition 1"
```

### Output

```text
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.921266] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.929611] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.950945] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.956741] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.962532] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.968074] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.973760] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.978966] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.989787] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.992701] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209328.995455] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.000305] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.005560] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.010657] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.020928] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.026479] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.031701] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.045841] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.067793] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.073120] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.113453] blk_partition_remap: fail for partition 1
Feb  5 19:52:19 192.168.81.1 business.router kernel: [209329.121202] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.158941] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.164184] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.169393] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.169992] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.174689] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.181538] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.185316] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.195350] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.207021] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.209140] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.212254] blk_partition_remap: fail for partition 1
Feb  5 19:52:20 192.168.81.1 business.router kernel: [209329.217381] blk_partition_remap: fail for partition 1
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


[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2024.10.101

 [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)






[//]: #@corifeus-footer:end
