#!/bin/bash
# // config Data
clear
# Definisi Warna 
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

mkdir -p /root/folder

echo -e "${GREEN}Harap Bersabar Tuan... Sedang download file menu...${NC}"
wget -q -O /root/status "https://raw.githubusercontent.com/mousethain/tahu/main/statushariini"
wget -q -O /etc/version "https://raw.githubusercontent.com/mousethain/tahu/main/versiupdate" && chmod +x /etc/version

# ==DOWNLOAD MENU==

wget -q -O /usr/bin/menu1 "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu1.sh" && chmod +x /usr/bin/menu1
wget -q -O /usr/bin/delv2ray "https://raw.githubusercontent.com/mousethain/tahu/main/menu/delv2ray.sh" && chmod +x /usr/bin/delv2ray
wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/mousethain/tahu/main/menu/autoreboot.sh" && chmod +x /usr/bin/autoreboot
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/restart.sh" && chmod +x /usr/bin/restart
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/mousethain/tahu/main/limit/tendang.sh" && chmod +x /usr/bin/tendang
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/clearlog.sh" && chmod +x /usr/bin/clearlog
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/mousethain/tahu/main/menu/running.sh" && chmod +x /usr/bin/running
wget -q -O /usr/bin/cek-trafik "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/cek-trafik.sh" && chmod +x /usr/bin/cek-trafik
wget -q -O /usr/bin/cek-speed "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/speedtes_cli.py" && chmod +x /usr/bin/cek-speed
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/cek-bandwidth.sh" && chmod +x /usr/bin/cek-bandwidth
wget -q -O /usr/bin/cek-ram "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/ram.sh" && chmod +x /usr/bin/cek-ram
wget -q -O /usr/bin/limit-speed "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/limit-speed.sh" && chmod +x /usr/bin/limit-speed
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu-ss.sh" && chmod +x /usr/bin/menu-ss
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu-vless.sh" && chmod +x /usr/bin/menu-vless
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-bckp "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/menu-bckp-github.sh" && chmod +x /usr/bin/menu-bckp
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/mousethain/tahu/main/menu/usernew.sh" && chmod +x /usr/bin/usernew
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/wbm "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/webmin.sh" && chmod +x /usr/bin/wbm
wget -q -O /usr/bin/changer "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/changer.sh" && chmod +x /usr/bin/changer
wget -q -O /usr/bin/addhost  "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/addhost.sh" && chmod +x /usr/bin/addhost
wget -q -O /usr/bin/genssl  "https://raw.githubusercontent.com/mousethain/tahu/main/minacantik/genssl.sh" && chmod +x /usr/bin/genssl
wget -q -O /usr/bin/fix "https://raw.githubusercontent.com/mousethain/tahu/main/menu/cf.sh" && chmod +x /usr/bin/fix
wget -q -O /etc/cyber.site "https://raw.githubusercontent.com/mousethain/tahu/main/mousevpn.site"
wget -q -O /root/versi "https://raw.githubusercontent.com/mousethain/tahu/main/versiupdate"
wget -q -O /usr/bin/updatsc "https://raw.githubusercontent.com/mousethain/tahu/main/menu/update.sh" && chmod +x /usr/bin/updatsc
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/mousethain/tahu/main/Themes/setting.sh" && chmod +x /usr/bin/setting
wget -q -O /usr/bin/menu-ipsec "https://raw.githubusercontent.com/mousethain/tahu/main/ipsec/menu-ipsec.sh" && chmod +x /usr/bin/menu-ipsec

# == END DOWNLOAD MENU ==

wget https://raw.githubusercontent.com/mousethain/tahu/main/SLDNS/wslow.sh && chmod +x wslow.sh
wget https://raw.githubusercontent.com/mousethain/tahu/main/backup/set-br.sh && chmod +x set-br.sh
bash set-br.sh
wget https://raw.githubusercontent.com/mousethain/tahu/main/Themes/thema.sh && chmod +x thema.sh

# Trial Scripts
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/mousethain/tahu/main/trial/trial.sh" && chmod +x /usr/bin/trial
wget -q -O /usr/bin/trial-vmess "https://raw.githubusercontent.com/mousethain/tahu/main/trial/trial-vmess.sh" && chmod +x /usr/bin/trial-vmess
wget -q -O /usr/bin/trial-trojan "https://raw.githubusercontent.com/mousethain/tahu/main/trial/trial-trojan.sh" && chmod +x /usr/bin/trial-trojan
wget -q -O /usr/bin/trial-udp "https://raw.githubusercontent.com/mousethain/tahu/main/trial/trial-udp.sh" && chmod +x /usr/bin/trial-udp
wget -q -O /usr/bin/trial-vless "https://raw.githubusercontent.com/mousethain/tahu/main/trial/trial-vless.sh" && chmod +x /usr/bin/trial-vless
wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/mousethain/tahu/main/trial/trial-generator.sh" && chmod +x /usr/bin/menu-trial

# Install Speedtest & Tools
sudo apt-get install curl -y
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest -y
sudo apt-get install python3-pip -y
pip3 install speedtest-cli
sudo apt install wondershaper -y
cd bin
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo make install
cd

# Additional Scripts
wget -q -O /usr/bin/addudp "https://raw.githubusercontent.com/mousethain/tahu/main/menu/addssh.sh" && chmod +x /usr/bin/addudp
wget -q -O /usr/bin/udp "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menush.sh" && chmod +x /usr/bin/udp
sudo apt install squid -y
mkdir -p /var/lib/ssnvpn-pro/
rm -f /usr/bin/menu-ssh
wget -q -O /var/lib/ssnvpn-pro/ipvps.conf "https://raw.githubusercontent.com/mousethain/tahu/main/ipvps.conf"
wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/mousethain/tahu/main/limit/autokill.sh" && chmod +x /usr/bin/autokill
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/mousethain/tahu/main/menu/restart.sh" && chmod +x /usr/bin/restart
wget -q -O /usr/bin/bot "https://raw.githubusercontent.com/mousethain/tahu/main/Finaleuy/bot.sh" && chmod +x /usr/bin/bot

# Limit Scripts
wget -q -O /usr/bin/limitvmess "https://raw.githubusercontent.com/mousethain/tahu/main/limit/limitvmess.sh" && chmod +x /usr/bin/limitvmess
wget -q -O /usr/bin/limitvless "https://raw.githubusercontent.com/mousethain/tahu/main/limit/limitvless.sh" && chmod +x /usr/bin/limitvless
wget -q -O /usr/bin/limittrojan "https://raw.githubusercontent.com/mousethain/tahu/main/limit/limittrojan.sh" && chmod +x /usr/bin/limittrojan
wget -q -O /usr/bin/sistem "https://raw.githubusercontent.com/mousethain/tahu/main/menu/sistem.sh" && chmod +x /usr/bin/sistem
wget -q -O /usr/bin/cftn "https://raw.githubusercontent.com/mousethain/tahu/main/menu/cftn.sh" && chmod +x /usr/bin/cftn
wget -q -O /usr/bin/infosc "https://raw.githubusercontent.com/mousethain/tahu/main/limit/info.sh" && chmod +x /usr/bin/infosc

# Crontab & System Config
wget -q -O /etc/crontab "https://raw.githubusercontent.com/mousethain/tahu/main/crontab" && chmod 644 /etc/crontab
echo "*/2 * * * * root sistem" >> /etc/crontab

rm -f /etc/rsyslog.d/50-default.conf
wget https://raw.githubusercontent.com/mousethain/tahu/main/50-default.conf
cp 50-default.conf /etc/rsyslog.d/50-default.conf
service rsyslog restart

wget -q -O /etc/default/dropbear "https://raw.githubusercontent.com/mousethain/tahu/main/dropbear" && chmod +x /etc/default/dropbear
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/mousethain/tahu/main/menu/xp.sh" && chmod +x /usr/bin/xp

# Services
cat >/etc/systemd/system/xp.service << EOF
[Unit]
Description=My Project
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/xp
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart xp
systemctl enable xp

cat >/etc/systemd/system/tendang.service << EOF
[Unit]
Description=PT.cybervpn ltd.
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/tendang
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart tendang
systemctl enable tendang

wget -q -O /usr/bin/limitipxray "https://raw.githubusercontent.com/mousethain/tahu/main/limit/limitipxray.py" && chmod +x /usr/bin/limitipxray

cat >/etc/systemd/system/iplimit.service << EOF
[Unit]
Description=PT.mousevpn ltd.
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 /usr/bin/limitipxray
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart iplimit
systemctl enable iplimit

wget -q -O /usr/bin/menu-noobzvpns "https://raw.githubusercontent.com/mousethain/tahu/main/menu/menu-noobzvpns.sh" && chmod +x /usr/bin/menu-noobzvpns
wget https://raw.githubusercontent.com/mousethain/tahu/main/menu/noobzvpns.zip
unzip -o noobzvpns.zip
bash install.sh
rm noobzvpns.zip
systemctl restart noobzvpns

touch /etc/trialxray.txt
wget -q -O /usr/bin/service-trial "https://raw.githubusercontent.com/mousethain/tahu/main/menu/service-trial.sh" && chmod +x /usr/bin/service-trial

cat >/etc/systemd/system/trial.service << EOF
[Unit]
Description=PT.mousevpn ltd.
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/service-trial
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart trial
systemctl enable trial

# Create directories
mkdir -p /tmp/vmess
mkdir -p /tmp/vless
mkdir -p /tmp/trojan
mkdir -p /etc/mousevpn/limit/vmess/ip/
mkdir -p /etc/mousevpn/limit/vless/ip/
mkdir -p /etc/mousevpn/limit/trojan/ip/
mkdir -p /etc/mousevpn/limit/ssh/ip/
mkdir -p /etc/ssnvpn/theme/
touch /etc/ssnvpn/theme/color.conf
touch /root/limit/rulesxray.txt

# Permissions Final check
chmod 777 /root/chat
chmod 777 /usr/bin/bot
chmod 777 /usr/bin/addudp
chmod 777 /usr/bin/udp
chmod +x /usr/bin/menu*
chmod +x /usr/bin/*

rm -rf set-br.sh
