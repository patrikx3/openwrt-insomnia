[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
[//]: #@corifeus-header:end
# Generate GPG and USIGN files

https://openwrt.org/docs/user-guide/keygen

Follow steps in the url aboce.

# TO GENERATE ON YOUR ON WORKSTATION

sudo apt install cmake
cd /build
git clone https://git.openwrt.org/project/usign.git
cd usign/
cmake .
make
sudo cp ./usign /usr/bin/usign
sudo chmod +x /usr/bin/usign


./usign -G -c "OpenWrt usign key of Patrik Laszlo / patrikx3" -s secret.key -p public.key

# Use the OpenWrt keyring

```bash
git clone https://git.openwrt.org/keyring.git
gpg --keyserver hkp://pool.sks-keyservers.net --send-keys 95F12499

cd ~/Projects/keyring/gpg/
gpg --armor --export --no-version --comment="OpenWrt usign key of Patrik Laszlo / patrikx3" 95F12499 > 95F12499.asc
git add 95F12499.asc
git commit -sm "OpenWrt usign key of Patrik Laszlo / patrikx3"

usign public key 25ad50a827ee6b11
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
