[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
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

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v2020.4.131

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end