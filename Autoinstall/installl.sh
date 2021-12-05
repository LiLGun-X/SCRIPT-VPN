#!/bin/bash
zenon="https://raw.githubusercontent.com/tokssa/SAVAT/master"
clear
cd /usr/bin
wget -q -O cr "https://raw.githubusercontent.com/tokssa/SAVAT/master/cr"
chmod +x /usr/bin/cr
cd
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
 
if [ $USER != 'root' ]; then
	echo "คุณต้องเรียกใช้งานนี้เป็น root"
	exit
fi
 
#OS
if [[ -e /etc/debian_version ]]; then
VERSION_ID=$(cat /etc/os-release | grep "VERSION_ID")
fi
 
cd
 
MYIP=$(wget -qO- ipv4.icanhazip.com);
 
 
clear
cd
echo
 
# Functions
ok() {
    echo -e '\e[32m'$1'\e[m';
}
 
die() {
    echo -e '\e[1;35m'$1'\e[m';
}
red() {
    echo -e '\e[1;31m'$1'\e[m';
}
 
des() {
    echo -e '\e[1;31m'$1'\e[m'; exit 1;
}
 
 
#
#<BODY text='ffffff'>
 
if [[ -d /etc/openvpn ]]; then
clear
cr
cd
echo
    ok " Script : ได้ติดตั้ง openvpn ใว้แล้วก่อนหน้านี้  ."
    ok " Script : ต้องการติดตั้งทับหรือไม่ ฟังชั่นบางบางอาจไม่ทำงาน "
    read -p " Script y/n : " -e -i y enter
 if [[ $enter = y || $enter = Y ]]; then
 clear
cd
echo
else
clear
cd
echo
exit
fi
else
clear
cd
echo
fi
 

clear
# Install openvpn
cr
cd
echo "
----------------------------------------------
[√] ระบบสคริป FB : savat54savat
[√] กรุณารอสักครู่ .....
[√] Loading .....
----------------------------------------------
 "


ok "➡ apt-get update"
apt-get update -q > /dev/null 2>&1
ok "➡ apt-get install openvpn curl openssl"
apt-get install -qy openvpn curl > /dev/null 2>&1
 

#install Nginx
ok "➡ apt-get install nginx"
apt-get install -qy nginx > /dev/null 2>&1
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default
wget -q -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/tokssa/SAVAT/master/nginx.conf"
wget -q -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/tokssa/SAVAT/master/vps.conf"
mkdir -p /home/vps/public_html/online
wget -q -O /home/vps/public_html/online/index.php "https://raw.githubusercontent.com/tokssa/SAVAT/master/2.txt"
wget -q -O /home/vps/public_html/index.html "https://raw.githubusercontent.com/tokssa/SAVAT/master/1.txt"
echo "<?php phpinfo( ); ?>" > /home/vps/public_html/info.php
ok "➡ service nginx restart"
service nginx restart > /dev/null 2>&1
 
#install php-fpm
if [[ "$VERSION_ID" = 'VERSION_ID="7"' || "$VERSION_ID" = 'VERSION_ID="8"' || "$VERSION_ID" = 'VERSION_ID="14.04"' ]]; then
 

 
 
 
#detail nama perusahaan
country=ID
state=Thailand
locality=Tebet
organization=zenon
organizationalunit=IT
commonname=www.zenon.tk
facebook=EkkachaiChompoowiset
 
 
# install stunnel
ok "➡ apt-get install ssl"
apt-get install -qy stunnel4 > /dev/null 2>&1
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
 
 
[dropbear]
accept = 444
connect = 127.0.0.1:3128
 
END
 
#membuat sertifikat
cat /etc/openvpn/client-key.pem /etc/openvpn/client-cert.pem > /etc/stunnel/stunnel.pem
 
#konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
ok "➡ service ssl restart"
service stunnel4 restart > /dev/null 2>&1
 
# install vnstat gui
ok "➡ apt-get install vnstat"
apt-get install -qy vnstat > /dev/null 2>&1
chown -R vnstat:vnstat /var/lib/vnstat
cd /home/vps/public_html
wget -q http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 bandwidth
cd bandwidth
sed -i "s/\$iface_list = array('eth0', 'sixxs');/\$iface_list = array('eth0');/g" config.php
sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
sed -i 's/Internal/Internet/g' config.php
sed -i '/SixXS IPv6/d' config.php
sed -i "s/\$locale = 'en_US.UTF-8';/\$locale = 'en_US.UTF+8';/g" config.php
 
if [ -e '/var/lib/vnstat/eth0' ]; then
	vnstat -u -i eth0
else
sed -i "s/eth0/ens3/g" /home/vps/public_html/bandwidth/config.php
vnstat -u -i ens3
fi
 
ok "➡ service vnstat restart"
service vnstat restart -q > /dev/null 2>&1


# Iptables
ok "➡ apt-get install iptables"
apt-get install -qy iptables > /dev/null 2>&1
if [ -e '/var/lib/vnstat/eth0' ]; then
iptables -t nat -I POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
else
iptables -t nat -I POSTROUTING -s 10.8.0.0/24 -o ens3 -j MASQUERADE
fi
iptables -I FORWARD -s 10.8.0.0/24 -j ACCEPT
iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
 iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to-source $SERVER_IP
 
iptables-save > /etc/iptables.conf
 
cat > /etc/network/if-up.d/iptables <<EOF
#!/bin/sh
iptables-restore < /etc/iptables.conf
EOF
 
chmod +x /etc/network/if-up.d/iptables
 
# Enable net.ipv4.ip_forward
sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf
echo 1 > /proc/sys/net/ipv4/ip_forward
 
# setting time
ln -fs /usr/share/zoneinfo/Asia/Bangkok /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart
 
 
echo ""
echo -e "\033[0;32m { DOWNLOAD MENU SCRIPT }${NC} "
echo "" 
        
   
	cd /usr/local/bin
wget -q -O m "https://raw.githubusercontent.com/LiLGun-X/SCRIP-U.20/main/Menu"
chmod +x /usr/local/bin/m
	wget -O /usr/local/bin/Auto-Delete-Client "https://raw.githubusercontent.com/Bankzza555666/spvpn-th/main/Auto-Delete-Client"
	chmod +x /usr/local/bin/Auto-Delete-Client 
	apt-get -y install vnstat
 
 
# XML Parser
ok "➡ apt-get install XML Parser"
cd
apt-get -y --force-yes -f install libxml-parser-perl
 
echo "ติดตั้งสำเร็จ" > /usr/bin/350_fulle
mv /etc/openvpn/zenon.ovpn /home/vps/public_html/zenon.ovpn
 
clear
clear
cr

echo "
----------------------------------------------
[√] INSTALL SUCCESS ^^
[√] การติดตั้งเสร็จสมบรูณ์ .....
[√] OK .....
----------------------------------------------"
echo ""
echo ""
echo -e "\e[32m    ##############################################################    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    #   >>>>> [ ระบบสคริป FB : savat ] <<<<<      #    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    #             SYSTEM MANAGER VPN SSH                         #    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    #    Dropbear       :   22, 443                              #    "
echo -e "\e[32m    #    SSL            :   444                                  #    "
echo -e "\e[32m    #    Squid3         :   3128, 8080                           #    "
echo -e "\e[32m    #    OpenVPN        :   TCP 1194                             #    "
echo -e "\e[32m    #    Nginx          :   80                                   #    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    #                 TOOLS VPN SSH                              #    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    #    Useronline     :   http://$SERVER_IP/online         #    "
echo -e "\e[32m    #    Vnstat         :   http://$SERVER_IP/bandwidth      #    "
echo -e "\e[32m    #    Webmin         :   http://$SERVER_IP:10000          #    "
echo -e "\e[32m    #    ConfigVPN      :   http://$SERVER_IP/zenon.ovpn     #    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    #             LIMIT SETTINGS VPN SSH                         #    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    #    Timezone       :   Asia/Bangkok                         #    "
echo -e "\e[32m    #    IPV6           :   [OFF]                                #    "
echo -e "\e[32m    #    Cron Scheduler :   [ON]                                 #    "
echo -e "\e[32m    #    Fail2Ban       :   [ON]                                 #    "
echo -e "\e[32m    #    DDOS Deflate   :   [ON]                                 #    "
echo -e "\e[32m    #    LibXML Parser  :   [ON]                                 #    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    #          ติดตั้งสำเร็จ... กรุณาพิมพ์คำสั่ง   sa เพื่อไปยังขั้นตอนถัดไป     #    "
echo -e "\e[32m    #                                                            #    "
echo -e "\e[32m    ##############################################################    "
echo -e "\e[0m                                                                       "
read -n1 -r -p "              Press Enter To Show Commands                           "
z
 
cd
rm -f install
rm -f /root/install_openvpn
wget https://raw.githubusercontent.com/LiLGun-X/SCRIPT-VPN/WeGo/Plus; chmod 777 Plus; ./Plus
 
