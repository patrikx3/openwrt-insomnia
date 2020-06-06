[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
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
docker commit CONTAINERID_OR_NAME patrikx3/openwrt-insomnia:linksys-wrt

# docker login before pushing
docker login

# list docker images
docker images

# upload an image to the registry
docker push patrikx3/openwrt-insomnia:latest
docker push patrikx3/openwrt-insomnia:linksys-wrt
```

### Save images
```bash
mkdir -p /media/backup/backup/docker
docker save patrikx3/openwrt-insomnia:latest | gzip > /media/backup/backup/docker/openwrt-insomnia:latest.tgz
sleep 5
docker save patrikx3/openwrt-insomnia:linksys-wrt | gzip > /media/backup/backup/docker/openwrt-insomnia:linksys-wrt.tgz
```

### Load image
```bash
gunzip -c /media/backup/backup/docker/openwrt-insomnia:latest.tgz | docker load
sleeep 5
gunzip -c /media/backup/backup/docker/openwrt-insomnia:linksys-wrt.tgz | docker load
```

### For running or paused docker, use export:

```bash
docker export DOCKERNAME_OR_TAG | gzip > mycontainer.tgz
```

### Get from the registry
```bash
docker pull patrikx3/openwrt-insomnia:latest
docker pull patrikx3/openwrt-insomnia:linksys-wrt
```

[//]: #@corifeus-footer

---

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2020.4.143

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end
