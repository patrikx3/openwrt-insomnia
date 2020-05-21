[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
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

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2020.4.141

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end
