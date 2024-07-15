[//]: #@corifeus-header

# ☕ OpenWrt Insomnia for Linksys WRT

                        
[//]: #@corifeus-header:end
# Linksys USB-TTL

Sometimes I get garbage characters, to fixed it I switch the USB cord.

# WARNING ABOUT SCREEN TTL
Make sure if you are in Gnome for example - not pure screen - make sure disable UTF8, choose some ASCII based like Central European etc...

# TFTPD Install

https://www.hiroom2.com/2017/07/02/debian-9-tftpd-hpa-en/

```bash
apt install -y tftpd-hpa
systemctl disable tftpd-hpa
service tftpd-hpa start 
```

Set interface:   
IP: 192.168.1.33  
Netmask: 255.255.255.0
Gateway: 192.168.1.1   
Profile name: TTL 
    
The default folder is:  
`/etc/default/tftpd-hpa`
which defaults to  
`/var/lib/tftpboot`

```bash
tftp 192.168.1.33
get openwrt-23.05.0-rc2-mvebu-cortexa9-linksys_wrt1900acs-squashfs-factory.img
```

# TTL

```bash
ufw disable
ls -l /dev/ttyUSB*
apt -y install screen
sudo screen /dev/ttyUSB0 115200,cs8,-ixon,ixoff,-istrip
sudo screen /dev/ttyUSB1 115200,cs8,-ixon,ixoff,-istrip

reboot

setenv ipaddr 192.168.1.1
setenv netmask 255.255.255.0
setenv serverip 192.168.1.33

setenv firmwareName openwrt-23.05.0-rc2-mvebu-cortexa9-linksys_wrt1900acs-squashfs-factory.img
setenv firmwareName insomnia-openwrt-23.05.0-rc2-mvebu-cortexa9-linksys_wrt1900acs-squashfs-factory.img


run update_both_images
```

```bash
ufw enable
service tftpd-hpa stop
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
