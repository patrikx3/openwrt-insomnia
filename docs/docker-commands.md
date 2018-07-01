[//]: #@corifeus-header

# ☕ Latest Stable OpenWrt Version with additional packages/feeds

                        
[//]: #@corifeus-header:end
## Docker commands

```bash
# build new images
docker build -t patrikx3/openwrt-insomnia .

# run an image
docker run -t -i patrikx3/openwrt-insomnia bash

# list containers
docker ps

# run into an existing container that is running
docker exec -it CONTAINERID_OR_NAME bash

# create an image for a container like
docker commit CONTAINERID_OR_NAME patrikx3/openwrt-insomnia:d-link-dir-860l-b1
docker commit CONTAINERID_OR_NAME patrikx3/openwrt-insomnia:linksys-wrt

# docker login before pushing
docker login

# list docker images
docker images

# upload an image to the registry
docker push patrikx3/openwrt-insomnia:latest
docker push patrikx3/openwrt-insomnia:d-link-dir-860l-b1
docker push patrikx3/openwrt-insomnia:linksys-wrt
```

### Save images
```bash
mkdir -p /media/backup/backup/docker
docker save patrikx3/openwrt-insomnia:latest | gzip > /media/backup/backup/docker/openwrt-insomnia:latest.tgz
sleep 5
docker save patrikx3/openwrt-insomnia:d-link-dir-860l-b1 | gzip > /media/backup/backup/docker/openwrt-insomnia:d-link-dir-860l-b1.tgz
sleep 5
docker save patrikx3/openwrt-insomnia:linksys-wrt | gzip > /media/backup/backup/docker/openwrt-insomnia:linksys-wrt.tgz
```

### Load image
```bash
gunzip -c /media/backup/backup/docker/openwrt-insomnia:latest.tgz | docker load
sleeep 5
gunzip -c /media/backup/backup/docker/openwrt-insomnia:d-link-dir-860l-b1.tgz | docker load
sleep 5
gunzip -c /media/backup/backup/docker/openwrt-insomnia:linksys-wrt.tgz | docker load
```

### For running or paused docker, use export:

```bash
docker export DOCKERNAME_OR_TAG | gzip > mycontainer.tgz
```

### Get from the registry
```bash
docker pull patrikx3/openwrt-insomnia:latest
docker pull patrikx3/openwrt-insomnia:d-link-dir-860l-b1
docker pull patrikx3/openwrt-insomnia:linksys-wrt
```

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.80-290 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end