[//]: #@corifeus-header

# Latest Stable OpenWrt Version with additional packages/feeds

                        
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

opkg update

# Linksys WRT1900ACS and Linksys WRT3200ACM 
# in insomnia, it is pre installed
opkg install kmod-usb-core kmod-fs-ext4 kmod-usb-storage-extras blkid block-mount e2fsprogs fdisk 

# D-Link DIR-860l B1
# in insomnia, it is pre installed
opkg install kmod-usb3 blkid kmod-usb-storage-extras blkid block-mount fdisk e2fsprogs 

# in insomnia, it is pre installed
insmod xhci-mtk

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

block detect > /etc/config/fstab; sed -i s/option$'\t'enabled$'\t'\'0\'/option$'\t'enabled$'\t'\'1\'/ /etc/config/fstab; sed -i s#/mnt/sda1#/overlay# /etc/config/fstab; cat /etc/config/fstab;

# set /dev/sda3 -> /media/storage
nano /etc/config/fstab

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
opkg update
opkg install node node-npm node-yarn
yarn install

# wps.md
# vpn-client-create.md
# restore config
reboot && exit

cd /opt/router-scripts-openwrt
./init-router
reboot && exit
```

[//]: #@corifeus-footer

---

[**P3X-OPENWRT-INSOMNIA**](https://pages.corifeus.com/openwrt-insomnia) Build v18.0.43-229 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end
