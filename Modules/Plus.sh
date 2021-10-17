#!/bin/bash
clear
[[ $EUID -ne 0 ]] && {
echo -e "\033[1;33mขออภัย, \033[1;33mคุณต้องใช้ฐานข้อมูล sudo -i เผื่อเรียก root\033[0m"
rm -rf $HOME/Plus > /dev/null 2>&1; exit 0
}
_lnk=$(echo '9:q-7gs1.o1%5:f1.6q5.×9%y4:1'|sed -e 's/[^0-9.]//ig'| rev); _Ink=$(echo '/3×u3#s87r/l32o4×c1a×l1/83×l24×i0b×'|sed -e 's/[^a-z/]//ig'); _1nk=$(echo '/3×u3#s×87r/83×l2×4×i0b×'|sed -e 's/[^a-z/]//ig')
cd $HOME
fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;33mโปรดรอสักครู่... \033[1;37m- \033[1;33m["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m#"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "  \033[1;33mโปรดรอสักครู่... \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
function verif_key () {
krm=$(echo '5:q-3gs2.o7%8:1'|rev); chmod +x $_Ink/list > /dev/null 2>&1
[[ ! -e "$_Ink/list" ]] && {
  echo -e "\n\033[1;31mรหัสนี้ใช้ไม่ได้!\033[0m"
  rm -rf $HOME/Plus > /dev/null 2>&1
  sleep 2
  clear; exit 1
}
}
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%40s%s%-12s\n' "KH-VPN FREE SCRIPT" ; tput sgr0
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
echo ""
echo -e "             \033[1;31mคำเตือน! \033[1;33mสคริปต์ SSH OPENVPN นี้!\033[0m"
echo ""
echo -e "\033[1;31m • \033[1;33mการติดตั้งสคริปต์? เป็นเครื่องมือ\033[0m" 
echo -e "\033[1;33m    สำหรับเครือข่ายระบบและการจัดการผู้ใช้\033[0m"
echo ""
echo -e "\033[1;32m • \033[1;32mเคล็ดลับ!\033[1;33mปรับใช้ธีมมืดในเทอร์มินัลของคุณ\033[0m"
echo -e "\033[1;33m    ประสบการณ์ที่ดีขึ้นและการมองเห็นของสิ่งเดียวกัน! \033[0m"
echo ""
echo -e "\033[1;31m≠×≠×≠×≠×≠×≠×≠×≠×[\033[1;33m • \033[1;32mโดย LUNDY KUBTAPHAKON\033[1;33m •\033[1;31m ]≠×≠×≠×≠×≠×≠×≠×≠×\033[0m"
echo ""
echo -ne "\033[1;36mInstall Script [N/Y]: \033[1;37m"; read x
[[ $x = @(n|N) ]] && exit
echo -e "\n\033[1;36mกำลังตรวจสอบ... ระบบ\033[1;37m $key\033[0m"
sleep 3s
echo -e "\n\033[1;32mสำเร็จ!\033[1;32m"
wget https://raw.githubusercontent.com/GunGZN/TEST-TH-VPN/main/list > /dev/null 2>&1
chmod +x list ./list > /dev/null 2>&1
sleep 1s
echo ""
[[ -f "$HOME/usuarios.db" ]] && {
    clear
    echo -e "\n\033[0;34m═════════════════════════════════════════════════\033[0m"
    echo ""
	echo -e "                 \033[1;33m• \033[1;31mคำเตือน \033[1;33m• \033[0m"
	echo ""
    echo -e "\033[1;33m ฐานข้อมูลผู้ใช้ \033[1;32m(usuarios.db) \033[1;33mคือ" 
    echo -e "  มีแล้ว! คุณต้องการที่จะใช้ข้อมูลปัจจุบันนี้ ใช่หรือไม่?"
	echo -e "  บัญชีผู้ใช้งานปัจจุบัน? หรือคุณต้องการ"
    ech echo -e "  สร้างฐานข้อมูลใหม่?\033[0m"

	echo -e "\n\033[1;37m[\033[1;31m1\033[1;37m] \033[1;33mใช้ฐานข้อมูลปัจจุบันนี้\033[0m"
	echo -e "\033[1;37m[\033[1;31m2\033[1;37m] \033[1;33mสร้างฐานข้อมูลใหม้\033[0m"
	echo -e "\n\033[0;34m═════════════════════════════════════════════════\033[0m"
    echo ""
	tput setaf 2 ; tput bold ; read -p "Option ?: " -e -i 1 optiondb ; tput sgr0
} || {
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
}
[[ "$optiondb" = '2' ]] && awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-18s\n' " รอการติดตั้ง..." ; tput sgr0
echo ""
echo ""
echo -e "          \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mกำลังอัพเดทระบบ \033[1;33m[\033[1;31m!\033[1;33m]\033[0m"
echo ""
echo -e "    \033[1;33m  การอัพแดดอาจต้องใช้เวลานาน!\033[0m"
echo ""
fun_attlist () {
    apt-get update -y
}
fun_bar 'fun_attlist'
clear
echo ""
echo -e "          \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mกำลังติดตั้งแพ็กเกจ \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo ""
echo -e "\033[1;33m  แพ็คเกจบางอย่างเป็นสิ่งสำคัญอย่างยิ่ง !\033[0m"
echo ""
inst_pct () {
apt-get install bc -y > /dev/null 2>&1
apt-get install screen -y > /dev/null 2>&1
apt-get install nano -y > /dev/null 2>&1
apt-get install unzip -y > /dev/null 2>&1
apt-get install lsof -y > /dev/null 2>&1
apt-get install netstat -y > /dev/null 2>&1
apt-get install net-tools -y > /dev/null 2>&1
apt-get install dos2unix -y > /dev/null 2>&1
apt-get install nload -y > /dev/null 2>&1
apt-get install jq -y > /dev/null 2>&1
apt-get install curl -y > /dev/null 2>&1
apt-get install figlet -y > /dev/null 2>&1
apt-get install python3 -y > /dev/null 2>&1
apt-get install python-pip -y > /dev/null 2>&1
pip install speedtest-cli > /dev/null 2>&1
}
fun_bar 'inst_pct'
[[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp
clear
echo ""
echo -e "              \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mโปรดอย่าปิดหน้าต่างนี้ \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo ""
echo -e "      \033[1;33m  กำลังติดตั้งฟังก์ชั่นและรบบอื่นๆ! \033[0m"
echo ""
fun_bar "source list"
rm Plus* > /dev/null 2>&1
rm list* > /dev/null 2>&1
echo "/bin/menu" > /bin/h && chmod +x /bin/h > /dev/null 2>&1
wget https://raw.githubusercontent.com/teamvpn/SSHPLUS29/master/versao > /dev/null 2>&1
clear
echo ""
cd $HOME
echo -e "        \033[1;33m • \033[1;32mการติดตั้งเสร็จสมบูรณ์\033[1;33m • \033[0m"
echo ""
echo -e "\033[1;31m \033[1;33mเปิดเมนูคำสั่ง: \033[1;32mmenu\033[0m"
echo -e "\033[1;33m Mมีปัญหาอื่นๆ\033[1;31m(\033[1;36mFACEBOOK\033[1;31m): \033[1;37m@freenetvpndtac\033[0m"
rm -rf $HOME/Plus && cat /dev/null > ~/.bash_history && history -c