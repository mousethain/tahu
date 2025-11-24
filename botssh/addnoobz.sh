#!/bin/bash
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "      °NOOBZVPN'S CREATE°            "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p "Username: " user
read -p "Password: " pass
read -p "Exp (0 for unlimited days):" exp
read -p "IP LIMIT " ip

if [ ! -e /etc/mousevpn/limit/noobs/ip/ ]; then
  mkdir -p /etc/mousevpn/limit/noobs/ip/
fi
echo "$ip" > /etc/mousevpn/limit/noobs/ip/$user

noobzvpns --add-user $user $pass --expired-user $user $exp
