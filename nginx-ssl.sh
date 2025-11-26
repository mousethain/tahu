#!/bin/bash
# Script Auto Install SSL & Nginx Config

# Warna
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'

echo -e "\n"
date
echo ""

# ==========================================
#     LOGIKA PENCARIAN DOMAIN OTOMATIS     #
# ==========================================
echo -e "[ ${GREEN}INFO${NC} ] Mencari file domain..."

mkdir -p /etc/xray /etc/v2ray

# Cari domain di beberapa lokasi
if [ -f "/root/domain" ]; then
    domain=$(cat /root/domain)
elif [ -f "/etc/xray/domain" ]; then
    domain=$(cat /etc/xray/domain)
    cp /etc/xray/domain /root/domain
elif [ -f "/etc/v2ray/domain" ]; then
    domain=$(cat /etc/v2ray/domain)
    cp /etc/v2ray/domain /root/domain
else
    echo -e "[ ${ORANGE}WARNING${NC} ] File domain tidak ditemukan. Meminta input domain..."
    read -rp "Input Domain : " domain
    echo "$domain" > /root/domain
    echo "$domain" > /etc/xray/domain
fi

# Validasi akhir
if [ -z "$domain" ]; then
    echo -e "[ ${RED}ERROR${NC} ] Domain tidak boleh kosong!"
    exit 1
fi

echo -e "[ ${GREEN}INFO${NC} ] Domain terdeteksi: ${ORANGE}$domain${NC}"
sleep 1

# ==========================================
#             INSTALASI PAKET 
# ==========================================
echo -e "[ ${GREEN}INFO${NC} ] Checking & Installing base packages"

echo -e "[ ${GREEN}INFO${NC} ] Memperbaiki Mirror Repository yang kedaluwarsa..."
sed -i 's|http://mirror.nevacloud.com/debian|http://deb.debian.org/debian|g' /etc/apt/sources.list
sed -i 's|http://security.debian.org/debian-security|http://deb.debian.org/debian-security|g' /etc/apt/sources.list

# update dan instalasi paket asli
apt clean all && apt update -y
apt install iptables iptables-persistent -y
sleep 1

echo -e "[ ${GREEN}INFO${NC} ] Setting ntpdate"
apt install ntpdate -y
ntpdate pool.ntp.org 
timedatectl set-ntp true
sleep 1

echo -e "[ ${GREEN}INFO${NC} ] Enable chronyd & chrony"
apt install chrony -y
systemctl enable chronyd
systemctl restart chronyd
systemctl enable chrony
systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
sleep 1

echo -e "[ ${GREEN}INFO${NC} ] Setting chrony tracking"
chronyc sourcestats -v
chronyc tracking -v

echo -e "[ ${GREEN}INFO${NC} ] Installing Dependencies"
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
apt install zip curl pwgen openssl netcat cron -y

# ==========================================
#             INSTALASI SSL 
# ==========================================
echo -e "[ ${GREEN}INFO${NC} ] Memulai Instalasi SSL untuk $domain"

systemctl stop nginx

# --- Buka Port 80 & 443
echo -e "[ ${GREEN}INFO${NC} ] Membuka Port 80 & 443 (iptables) untuk verifikasi SSL..."
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp --dport 443 -j ACCEPT
iptables-save > /etc/iptables/rules.v4 

mkdir -p /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256 --force
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc

# Setup Auto-Renew SSL
echo -n '#!/bin/bash
/etc/init.d/nginx stop
"/root/.acme.sh"/acme.sh --cron --home "/root/.acme.sh" &> /root/renew_ssl.log
/etc/init.d/nginx start
/etc/init.d/nginx status
' > /usr/local/bin/ssl_renew.sh
chmod +x /usr/local/bin/ssl_renew.sh
if ! grep -q 'ssl_renew.sh' /var/spool/cron/crontabs/root;then (crontab -l;echo "15 03 */3 * * /usr/local/bin/ssl_renew.sh") | crontab;fi

mkdir -p /home/vps/public_html

# ==========================================
#              KONFIGURASI NGINX
# ==========================================
echo -e "[ ${GREEN}INFO${NC} ] Membuat Konfigurasi Nginx..."

cat >/etc/nginx/conf.d/xray.conf <<EOF
    server {
             listen 80;
             listen [::]:80;
             listen 443 ssl http2 reuseport;
             listen [::]:443 http2 reuseport;	
             server_name $domain;
             ssl_certificate /etc/xray/xray.crt;
             ssl_certificate_key /etc/xray/xray.key;
             ssl_ciphers EECDH+CHACHA20:EECDH+CHACHA20-draft:EECDH+ECDSA+AES128:EECDH+aRSA+AES128:RSA+AES128:EECDH+ECDSA+AES256:EECDH+aRSA+AES256:RSA+AES256:EECDH+ECDSA+3DES:EECDH+aRSA+3DES:RSA+3DES:!MD5;
             ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;
             root /home/vps/public_html;
        }
EOF

sed -i '$ ilocation /' /etc/nginx/conf.d/xray.conf
sed -i '$ i{' /etc/nginx/conf.d/xray.conf
sed -i '$ iproxy_redirect off;' /etc/nginx/conf.d/xray.conf
sed -i '$ iproxy_pass http://127.0.0.1:700;' /etc/nginx/conf.d/xray.conf
sed -i '$ iproxy_http_version 1.1;' /etc/nginx/conf.d/xray.conf
sed -i '$ iproxy_set_header X-Real-IP \$remote_addr;' /etc/nginx/conf.d/xray.conf
sed -i '$ iproxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' /etc/nginx/conf.d/xray.conf
sed -i '$ iproxy_set_header Upgrade \$http_upgrade;' /etc/nginx/conf.d/xray.conf
sed -i '$ iproxy_set_header Connection "upgrade";' /etc/nginx/conf.d/xray.conf
sed -i '$ iproxy_set_header Host \$http_host;' /etc/nginx/conf.d/xray.conf
sed -i '$ i}' /etc/nginx/conf.d/xray.conf

# ==========================================
#               RESTART SERVICE
# ==========================================
echo -e "$yell[SERVICE]$NC Restart All service"
systemctl daemon-reload
sleep 1
echo -e "[ ${GREEN}ok${NC} ] Enable & restart xray "
systemctl restart nginx
systemctl enable runn
systemctl restart runn
cp /root/domain /etc/xray/domain

if [ -f /root/scdomain ];then
rm /root/scdomain > /dev/null 2>&1
fi
clear
rm -f nginx-ssl.sh
