[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
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
