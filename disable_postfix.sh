#!/bin/bash
inet_protocols = ipv4 >> /etc/postfix/main.cf
systemctl restart postfix.service
