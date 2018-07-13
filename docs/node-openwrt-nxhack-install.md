[//]: #@corifeus-header

# ☕ Latest Stable OpenWrt Version with additional packages/feeds

                        
[//]: #@corifeus-header:end
# Re-compile a node package from OpenWrt

Change the ```feeds.conf``` from ```nxhack``` to ```patrixk3``` for testing.

## Change the feeds.conf from nxhack to patrixk3 for testing

```bash
nano feeds.conf
# Change the feeds.conf from nxhack to patrixk3 for testing
```

## Run all this

```bash
./copy-scripts.sh
./scripts/feeds update -a
./scripts/feeds install -a

# node
./scripts/feeds update node
rm ./package/feeds/packages/node* || true
./scripts/feeds install -a -p node

./scripts/feeds install node-npm-check-updates
#make oldconfig
make V=s -j9 package/feeds/node/node-npm-check-updates/{clean,prepare,compile}

```

# After the error to change the hash use like

Execute the title section ```Run all this again``` again.
  
Finally:

```bash
make V=s -j9 package/feeds/node/node-npm-check-updates/{clean,prepare,compile}
```
[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.84-302 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end