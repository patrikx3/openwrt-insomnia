[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
[//]: #@corifeus-header:end
# Ext-root via USB driver Virgin

https://openwrt.org/docs/user-guide/extroot_configuration

* I use 3 partitions
  * /dev/sda1 - the ext root, 100gb
  * /dev/sda2 - swap, 10gb
  * /dev/sda3 - /storage, 390gb

* Move to a new terminal and log in

```bash
ssh root@192.168.1.1

sysupgrade -r /tmp/backup-*.tar.gz

opkg update

# Linksys WRT1900ACS and Linksys WRT3200ACM 
# in insomnia, it is pre installed
opkg install kmod-usb-core e2fsprogs kmod-usb-storage kmod-fs-ext4 kmod-usb-storage-extras block-mount kmod-usb3 blkid block-mount fdisk 
# kmod-scsi-core kmod-usb2 
opkg install kmod-usb-core kmod-usb-ledtrig-usbport kmod-usb-storage kmod-usb-storage-uas kmod-usb-uhci kmod-usb3 kmod-usb2 libusb-1.0 usbutils

# lsusb
# nano /etc/modprobe.d/ignore_uas.conf
# options usb-storage quirks=0bc2:2320:u
# reboot

# in insomnia, it is pre installed
insmod xhci-mtk

###################
# v23.05.0-rc2		
# mv /etc/config/system /etc/config/system.old 
# mv /etc/config/network /etc/config/network.old
# always regenerate and then fix it
# renaming those to network.old and system.old before sysupgrade is sufficient
###################
mv /etc/config/system /etc/config/system.old 
mv /etc/config/network /etc/config/network.old

mkfs.ext4 /dev/sda1
# say yes

# if you already have it and it is not
# overlay, then you do not need it,
# it will work
# non overlay is working,
# but if the HD is virgin you need an ext4 filesytem
# CAREFUL TO DELETE STORAGE DATA! 
# mkfs.ext4 /dev/sda3
# say yes

mkdir -p /media/storage

/sbin/block detect > /etc/config/fstab; sed -i s/option$'\t'enabled$'\t'\'0\'/option$'\t'enabled$'\t'\'1\'/ /etc/config/fstab; sed -i s#/mnt/sda1#/overlay# /etc/config/fstab; cat /etc/config/fstab;

# set /dev/sda3 -> /media/storage
# nano /etc/config/fstab

# built the overlay into the drive
mount /dev/sda1 /mnt ; tar -C /overlay -cvf - . | tar -C /mnt -xf - ; umount /mnt

swapon /dev/sda2


# is it good? then we are good! if it is not, uncheck Keep settings 
# install the factory now and redo from creating the partition
# finally 
# check show fstab, might dont need again
uci show fstab 

uci commit
reboot && exit

# wait so that the network is connected
ssh root@192.168.1.1 # if you have existing then there like 192.168.1.1

uci show fstab 
cat /etc/config/fstab
df -h 

# THIS IS MY OWN SETUP
# if the WAN is not DHCP then have to restore the config first
# this is my own setup, you don't needed
# just in my /dev/sda3 i have monthly, weekly and daily backup
mkdir -p /opt/ 
cd /opt 
git config --global http.sslVerify "false" 
git clone https://git.patrikx3.com/router-scripts-openwrt.git 

cd router-scripts-openwrt
npm install --force --verbose

# an error with dnsmasq-dhcp wrt3200acm/wrt32x
# /etc/dnsmasq.confg => except-interface=eth1.2

./init-router
reboot && exit

# have to make sure that ./image-builder-files/etc/sysupgrade.conf includes in /cgi-bin/luci/admin/system/flashops/backupfiles
```

#### Crypto accelerator
https://openwrt.org/docs/techref/hardware/cryptographic.hardware.accelerators

```bash
openssl engine -t -c
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
