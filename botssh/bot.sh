#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

IZIN=$(curl -sS https://raw.githubusercontent.com/mousethain/tahu/main/gerung | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo "IZIN DI TERIMA!!"
else
clear
figlet "Akses di tolak!! Silakan Hubungi Admin" | lolcat
exit 0
fi

#install
cp /media/mousevpn/var.txt /tmp
cp /root/mousevpn/var.txt /tmp
rm -rf cybervpn
apt update && apt upgrade -y
apt install python3 python3-pip -y
apt install sqlite3 -y
cd /media/
rm -rf mousevpn
wget https://raw.githubusercontent.com/mousethain/tahu/main/botssh/mousevpn.zip
unzip mousevpn.zip
cd mousevpn
rm var.txt
rm database.db
pip3 install -r requirements.txt
pip install pillow
pip install speedtest-cli
pip3 install aiohttp
pip3 install paramiko



cat > /etc/systemd/system/mousevpn.service << END
[Unit]
Description=Simple MouseVpn - @MouseVpn
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/nenen
Restart=always

[Install]
WantedBy=multi-user.target

END
systemctl daemon-reload
systemctl start mousevpn
systemctl enable mousevpn

clear
echo "downloading asset"

wget -q -O /usr/bin/panelbot "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/panelbot.sh" && chmod +x /usr/bin/panelbot





wget -q -O /usr/bin/addnoobz "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/addnoobz.sh" && chmod +x /usr/bin/addnoobz



wget -q -O /media/log-install.txt "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/log-install.txt"



wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/add-vless.sh" && chmod +x /usr/bin/add-vless

wget -q -O /usr/bin/addtr "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/addtr.sh" && chmod +x /usr/bin/addtr


wget -q -O /usr/bin/addws "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/addws.sh" && chmod +x /usr/bin/addws


wget -q -O /usr/bin/addss "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/addss.sh" && chmod +x /usr/bin/addss

wget -q -O /usr/bin/cek-ssh "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-ssh.sh" && chmod +x /usr/bin/cek-ssh



wget -q -O /usr/bin/cek-ss "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-ss.sh" && chmod +x /usr/bin/cek-ss




wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-tr.sh" && chmod +x /usr/bin/cek-tr

wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-vless.sh" && chmod +x /usr/bin/cek-vless

wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-ws.sh" && chmod +x /usr/bin/cek-ws

wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/del-vless.sh" && chmod +x /usr/bin/del-vless




wget -q -O /usr/bin/cek-noobz "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-noobz.sh" && chmod +x /usr/bin/cek-noobz



wget -q -O /usr/bin/deltr "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/deltr.sh" && chmod +x /usr/bin/deltr

wget -q -O /usr/bin/delws "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/delws.sh" && chmod +x /usr/bin/delws



wget -q -O /usr/bin/delss "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/delss.sh" && chmod +x /usr/bin/delss



wget -q -O /usr/bin/renew-ss "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/renew-ss.sh" && chmod +x /usr/bin/renew-ss


wget -q -O /usr/bin/renewtr "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/renewtr.sh" && chmod +x /usr/bin/renewtr


wget -q -O /usr/bin/renewvless "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/renewvless.sh" && chmod +x /usr/bin/renewvless


wget -q -O /usr/bin/renewws "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/renewws.sh" && chmod +x /usr/bin/renewws


wget -q -O /usr/bin/cek-mws "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-mws.sh" && chmod +x /usr/bin/cek-mws

wget -q -O /usr/bin/cek-mvs "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-mvs.sh" && chmod +x /usr/bin/cek-mvs


wget -q -O /usr/bin/cek-mss "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-mss.sh" && chmod +x /usr/bin/cek-mss



wget -q -O /usr/bin/cek-mts "https://raw.githubusercontent.com/mousethain/tahu/main/botssh/cek-mts.sh" && chmod +x /usr/bin/cek-mts

cp /tmp/var.txt /media/mousevpn

echo " Installations complete, type /menu on your bot "

rm /media/mousevpn.zip
