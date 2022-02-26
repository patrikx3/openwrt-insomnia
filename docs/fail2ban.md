[//]: #@corifeus-header

# ☕ OpenWrt with latest NodeJs for Linksys WRT

                        
[//]: #@corifeus-header:end
# Fail2Ban is not easy, but can be done cooly!

It is for DDWRT, but even easier to use with ExtRoot and OpenWrt. Just don't have enough time to write down everything.

Right now, I use git but you can download the latest as well.

```bash
opkg install git git-http bash ca-bundle ca-certificates python  
 
cd /opt 
git clone https://github.com/fail2ban/fail2ban.git 
cd fail2ban 
mkdir -p /opt/log
mkdir -p /opt/run/fail2ban
mkdir -p /opt/lib/fail2ban/
cp /opt/fail2ban/config/jail.conf /opt/fail2ban/config/jail.local
cp /opt/fail2ban/config/fail2ban.conf /opt/fail2ban/config/fail2ban.local

```

# Required modification for ```fail2ban.local```
```
logtarget = /opt/log/fail2ban.log
socket = /opt/run/fail2ban/fail2ban.sock
pidfile = /opt/run/fail2ban/fail2ban.pid
dbfile = /opt/lib/fail2ban/fail2ban.sqlite3
```

# Setup
There will be an info that /etc/fail2ban is not writable, but it is not a problems
```
cd /opt/fail2ban 
setup.py install 
```

# Init script ```/opt/etc/init.d/fail2ban```
```bash
#!/usr/bin/env bash
/opt/bin/python /opt/fail2ban/bin/fail2ban-server -c /opt/fail2ban/config/ $1
```

# Startup command in like DDWRT

```bash
/opt/etc/init.d/fail2ban start
```

# Shutdown command in like DDWRT command
```bash
/opt/etc/init.d/fail2ban stop
```

by Patrik aka ```p3x-robot / p3x / corifeus```

[//]: #@corifeus-footer

---

🙏 This is an open-source project. Star this repository, if you like it, or even donate to maintain the servers and the development. Thank you so much!

Possible, this server, rarely, is down, please, hang on for 15-30 minutes and the server will be back up.

All my domains ([patrikx3.com](https://patrikx3.com) and [corifeus.com](https://corifeus.com)) could have minor errors, since I am developing in my free time. However, it is usually stable.

**Note about versioning:** Versions are cut in Major.Minor.Patch schema. Major is always the current year. Minor is either 4 (January - June) or 10 (July - December). Patch is incremental by every build. If there is a breaking change, it should be noted in the readme.


---

[**P3X-OPENWRT-INSOMNIA**](https://corifeus.com/openwrt-insomnia) Build v2022.4.107

[![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) [![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software)


## P3X Sponsor

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com/?from=patrikx3)

[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/?from=patrikx3)




[//]: #@corifeus-footer:end
