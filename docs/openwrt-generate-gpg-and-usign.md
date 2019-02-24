[//]: #@corifeus-header

# ☕ OpenWrt Latest Stable with latest NodeJs, kaloz/mwlwifi's latest WIFI driver, latest Redis stable

                        
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

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v2019.2.24-2 

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end