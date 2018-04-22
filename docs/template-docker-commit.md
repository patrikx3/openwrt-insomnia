[//]: #@corifeus-header

# ☕ Latest Stable OpenWrt Version with additional packages/feeds

                        
[//]: #@corifeus-header:end
# Info 
About updating new node version it is in README.md and create-from-scratch.md

# Terminal 1

```bash
./build-docker

# you can execute the first line in Terminal 3
# continue and start Terminal 1 and Terminal 2
./run
./make-d-link-dir-860l-b1
```

# Terminal 2
```bash
# after Terminal 1 ./build-docker is finished
./run
./make-linksys-wrt
# no execute Terminal 3
```

# Terminal 3

```bash
docker push patrikx3/openwrt-insomnia:latest

docker commit CONTAINER_ID patrikx3/openwrt-insomnia:d-link-dir-860l-b1
docker push patrikx3/openwrt-insomnia:d-link-dir-860l-b1

docker commit CONTAINER_ID patrikx3/openwrt-insomnia:linksys-wrt
docker push patrikx3/openwrt-insomnia:linksys-wrt
```
[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.49-245 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end