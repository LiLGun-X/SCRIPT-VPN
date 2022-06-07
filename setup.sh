#!/bin/bash
echo ''
clear
echo ''
echo ' .......................................................... ' 
echo '     ____   ____  __ __   ____  ____     ___  ______        ' 
echo '    |    | /    T|  T  | /    T|    \   /  _]|      T       '  
echo '    l__  |Y  o  ||  |  |Y  o  ||  _  Y /  [_ |      |       ' 
echo '    __j  ||     ||  |  ||     ||  |  |Y    _]l_j  l_j       '
echo '   /  |  ||  _  |l  :  !|  _  ||  |  ||   [_   |  |         '
echo '   \  `  ||  |  | \   / |  |  ||  |  ||     T  |  |         '
echo '    \____jl__j__j  \_/  l__j__jl__j__jl_____j  l__j         '
echo '                      Copyright ©AJ           '                              
echo ''                                                         
echo '                    ⚡ FREE สคริป ⚡     '
echo ' .......................................................... '
echo '              Auto Installation Script By AJ                '
echo '                     MiniScript 2021                        '
echo '                     Contact Owner                          '  
echo '                Telegram : @yallaaj                         '
echo '                Email : syedjawwad@javanet.tech             ' 
echo '                Tel   : +66934567688                        '    
echo '...........................................................'
echo ''
echo '                     โปรดรอสักครู่..... !                      '
echo ' .......................................................... '
sleep 5
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
clear
echo -e "${green} คุณได้รับอนุญาตให้ใช้งานได้...${NC}"
sleep 1
clear
echo '============================================='
echo '                โปรดรอสักครู่... '
echo '       ระบบจะทำการอัพเดทและอัพเกรดเซิฟเวอร์'
echo '============================================='
sleep 5
apt update && apt upgrade -y
clear
echo '============================================='
echo '                 เรียบร้อยแล้ว '
echo '============================================='
sleep 5
clear
echo '============================================='
echo '         ระบบกำลังจะดำเนินการลงสคริปให้กับท่าน '
echo '============================================='
sleep 5
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo '============================================='
echo "      โปรดใส่โดเมนของท่าน, หากไม่มีกด ENTER "
echo '============================================='
read -p "โฮสต์ / โดเมน​ : " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
clear
echo '============================================='
echo '        กำลังติดตั้ง SSH & OPENVPN '
echo '============================================='
sleep 3
wget https://raw.githubusercontent.com/LiLGun-X/SCRIPTX-VIP/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
echo '============================================='
echo '        กำลังติดตั้ง V2RAY '
echo '============================================='
sleep 3
wget https://raw.githubusercontent.com/LiLGun-X/SCRIPTX-VIP/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
rm -f /root/ssh-vpn.sh
rm -f /root/ins-vt.sh
history -c
echo "1.2" > /home/ver
clear
#cert 
cert
echo " echo ' ยินดีต้อนรับ   ' " >> .profile
echo " echo ' AJ MINI SCRIPT        '" >> .profile
echo " echo ' ติดต่อ​เจ้าของสคริป​ t.me/yallaaj     '" >> .profile
echo '============================================='
echo "                ติดตั้งสำเร็จแล้ว"
echo '============================================='
clear
echo " "
echo "===========================-ฟรีสคริป-=========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 444, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - SSH WS                  : 2082"| tee -a log-install.txt 
echo "   - SSL WS                  : 2083"| tee -a log-install.txt
echo "   - OVPN WS                 : 2084"| tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 8442"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Bangkok (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - ออโต้รีบูตเวลา 05.00 GMT +7" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""
echo "--------------------------สคริปโดยเอเจ------------------------" | tee -a log-install.txt
echo ""
echo " อย่าลืมรีบูตด้วยเด้อ " 
sleep 10
rm -f setup.sh


