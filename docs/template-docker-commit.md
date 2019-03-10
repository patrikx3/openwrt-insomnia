[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs, Redis and Linksys WRT Wifi

                        
[//]: #@corifeus-header:end
# Info 
About updating new node version it is in README.md and create-from-scratch.md

# Terminal 1
```bash
# after Terminal 1 ./build-docker is finished
./run
./make-linksys-wrt
# no execute Terminal 3
```

# Terminal 2

```bash
docker push patrikx3/openwrt-insomnia:latest

docker commit CONTAINER_ID patrikx3/openwrt-insomnia:linksys-wrt
docker push patrikx3/openwrt-insomnia:linksys-wrt
```
[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v2019.3.10-1 

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end