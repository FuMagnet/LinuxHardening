#!/bin/bash
# Installation von fail2ban

sudo apt update
sudo apt-get install fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
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
