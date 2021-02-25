#!/bin/bash
# Installation von fail2ban

sudo apt update
sudo apt-get install fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

echo >> /etc/fail2ban/jail.local
echo "[proxmox2]" >> /etc/fail2ban/jail.local
echo "enabled = true" >> /etc/fail2ban/jail.local
echo "port    = https,http,8006" >> /etc/fail2ban/jail.local
echo "filter  = proxmox2" >> /etc/fail2ban/jail.local
echo "logpath  = /var/log/daemon.log" >> /etc/fail2ban/jail.local
echo "maxretry = 7" >> /etc/fail2ban/jail.local
echo "bantime  = 43200" >> /etc/fail2ban/jail.local

touch /etc/fail2ban/filter.d/proxmox2.conf

echo "[Definition]" >> /etc/fail2ban/filter.d/proxmox2.conf
echo "failregex = pvedaemon\[.*authentication failure; rhost=<HOST> user=.*msg=.*" >> /etc/fail2ban/filter.d/proxmox2.conf
echo "ignoreregex = " >> /etc/fail2ban/filter.d/proxmox2.conf

sudo systemctl enable fail2ban
sudo systemctl start fail2banbash


# Das muss noch erledigt werden
# nano /etc/fail2ban/jail.local
# Sperrzeit erhöhen:
# "bantime" is the number of seconds that a host is banned.
# bantime  = 600

# Log anzeigen
# sudo less /var/log/fail2ban.log
# tail -f /var/log/fail2ban.log
