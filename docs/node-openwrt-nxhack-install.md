[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
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
