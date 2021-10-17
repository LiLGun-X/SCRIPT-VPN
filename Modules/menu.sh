#!/bin/bash
fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
[[ ! -e /usr/lib/sshplus ]] && rm -rf /bin/menu > /dev/null 2>&1
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "\033[1;33m["
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
   echo -ne "\033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
IP=$(cat /etc/IP)
x="ok"
menu ()
{
velocity () {
aguarde () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
[[ ! -d /etc/SSHPlus ]] && rm -rf /bin/menu
${comando[0]} > /dev/null 2>&1
${comando[1]} > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;33mWAIT \033[1;37m- \033[1;33m["
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
   echo -ne "  \033[1;33mWAIT \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
fun_tst () {
speedtest --share > speed
}
echo ""
echo -e "   \033[1;32mTESTING SERVER SPEED !\033[0m"
echo ""
aguarde 'fun_tst'
echo ""
png=$(cat speed | sed -n '5 p' |awk -F : {'print $NF'})
down=$(cat speed | sed -n '7 p' |awk -F :  {'print $NF'})
upl=$(cat speed | sed -n '9 p' |awk -F :  {'print $NF'})
lnk=$(cat speed | sed -n '10 p' |awk {'print $NF'})
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;32mPING (LATENCY):\033[1;37m$png"
echo -e "\033[1;32mDOWNLOAD:\033[1;37m$down"
echo -e "\033[1;32mUPLOAD:\033[1;37m$upl"
echo -e "\033[1;32mLINK: \033[1;36m$lnk\033[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
rm -rf $HOME/speed
}
#limiter
function limit1 () {
   clear
   echo -e "\n\033[1;32mSTARTING THE LIMITER ...\033[0m"
   echo ""
   fun_bar 'screen -dmS limiter limiter' 'sleep 3'
   [[ $(grep -wc "limiter" /etc/autostart) = '0' ]] && {
       echo -e "ps x | grep 'limiter' | grep -v 'grep' && echo 'ON' || screen -dmS limiter limiter" >> /etc/autostart
   } || {
       sed -i '/limiter/d' /etc/autostart
	   echo -e "ps x | grep 'limiter' | grep -v 'grep' && echo 'ON' || screen -dmS limiter limiter" >> /etc/autostart
   }
   echo -e "\n\033[1;32m  ACTIVE LIMITER!\033[0m"
   sleep 3
   menu
}
function limit2 () {
   clear
   echo -e "\033[1;32mSTOPPING THE LIMITER ... \033[0m"
   echo ""
   fun_stplimiter () {
      sleep 1
      screen -r -S "limiter" -X quit
      screen -wipe 1>/dev/null 2>/dev/null
      [[ $(grep -wc "limiter" /etc/autostart) != '0' ]] && {
          sed -i '/limiter/d' /etc/autostart
      }
      sleep 1
   }
   fun_bar 'fun_stplimiter' 'sleep 3'
   echo -e "\n\033[1;31m STOP LIMIT !\033[0m"
   sleep 3
   menu
}
function limit_ssh () {
[[ $(ps x | grep "limiter"|grep -v grep |wc -l) = '0' ]] && limit1 || limit2
}

function autoexec () {
   if grep "menu;" /etc/profile > /dev/null; then
      clear
      echo -e "\033[1;32mDISABLING AUTO RUN\033[0m"
      offautmenu () {
         sed -i '/menu;/d' /etc/profile
      }
      echo ""
      fun_bar 'offautmenu'
      echo ""
      echo -e "\033[1;31mAUTO RUN OFF!\033[0m"
      sleep 1.5s
      menu2
   else
      clear
      echo -e "\033[1;32mACTIVATING AUTO RUN\033[0m"
      autmenu () {
         grep -v "^menu;" /etc/profile > /tmp/tmpass && mv /tmp/tmpass /etc/profile
         echo "menu;" >> /etc/profile
      }
      echo ""
      fun_bar 'autmenu'
      echo ""
      echo -e "\033[1;32mAUTO RUN ON!\033[0m"
      sleep 1.5s
      menu2
   fi

}
#menu2
menu2 (){
[[ -e /etc/Plus-torrent ]] && stsf=$(echo -e "\033[1;32m◉ ") || stsf=$(echo -e "\033[1;31m○ ")
stsbot=$(ps x | grep "bot_plus"|grep -v grep > /dev/null && echo -e "\033[1;32m◉ " || echo -e "\033[1;31m○ ")
autm=$(grep "menu;" /etc/profile > /dev/null && echo -e "\033[1;32m◉ " || echo -e "\033[1;31m○ ")
[[ ! -e /usr/lib/licence ]] && rm -rf /bin > /dev/null 2>&1
if [[ "$(grep -c "Ubuntu" /etc/issue.net)" = "1" ]]; then
system=$(cut -d' ' -f1 /etc/issue.net)
system+=$(echo ' ')
system+=$(cut -d' ' -f2 /etc/issue.net |awk -F "." '{print $1}')
elif [[ "$(grep -c "Debian" /etc/issue.net)" = "1" ]]; then
system=$(cut -d' ' -f1 /etc/issue.net)
system+=$(echo ' ')
system+=$(cut -d' ' -f3 /etc/issue.net)
else
system=$(cut -d' ' -f1 /etc/issue.net)
fi
_ons=$(ps -x | grep sshd | grep -v root | grep priv | wc -l)
[[ "$(cat /etc/SSHPlus/Exp)" != "" ]] && _expuser=$(cat /etc/SSHPlus/Exp) || _expuser="0"
[[ -e /etc/openvpn/openvpn-status.log ]] && _onop=$(grep -c "10.8.0" /etc/openvpn/openvpn-status.log) || _onop="0"
[[ -e /etc/default/dropbear ]] && _drp=$(ps aux | grep dropbear | grep -v grep | wc -l) _ondrp=$(($_drp - 1)) || _ondrp="0"
_onli=$(($_ons + $_onop + $_ondrp))
_ram=$(printf ' %-9s' "$(free -h | grep -i mem | awk {'print $2'})")
_usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
_usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
_core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
_system=$(printf '%-14s' "$system")
_hora=$(printf '%(%H:%M:%S)T')
_onlin=$(printf '%-5s' "$_onli")
_userexp=$(printf '%-5s' "$_expuser")
_tuser=$(awk -F: '$3>=1000 {print $1}' /etc/passwd | grep -v nobody | wc -l)
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[41;1;37m               ⇱ SSHPLUS MANAGER ⇲                \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;32mระบบ               หน่วยความจำ         โปรเซสเซอร์  "
echo -e "\033[1;31mOS: \033[1;37m$_system \033[1;31mTotal:\033[1;37m$_ram \033[1;31mCPU: \033[1;37m$_core\033[0m"
echo -e "\033[1;31mTime: \033[1;37m$_hora     \033[1;31mIn Use: \033[1;37m$_usor \033[1;31mIn Use: \033[1;37m$_usop\033[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
[[ ! -e /tmp/att ]]  && {
    echo -e "\033[1;32mออนไลน์:\033[1;37m $_onlin     \033[1;31mหมดอายุ: \033[1;37m$_userexp \033[1;33mบัญชี้ทั้งหมด: \033[1;37m$_tuser\033[0m"
    var01='\033[1;37m•'
} || {
    echo -e "  \033[1;33m[\033[1;31m!\033[1;33m]  \033[1;32mTHERE IS A UPDATE AVAILABLE  \033[1;33m[\033[1;31m!\033[1;33m]\033[0m"
    var01="\033[1;32m!"
}
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[0;31m╭━━━━━━━━━━━━━━━━━━━━━━━╮"
echo -e "\033[0;32m┃━╭━━━┳╮━╭┳━╮━╭╮━╭━╮╭━╮━┃"
echo -e "\033[0;33m┃╱┃╭━╮┃┃╱┃┃╱╰╮┃┃╱╰╮╰╯╭╯╱┃"
echo -e "\033[0;34m┃━┃┃━╰┫┃━┃┃╭╮╰╯┃━━╰╮╭╯━━┃"
echo -e "\033[0;35m┃╱┃┃╭━┫┃╱┃┃┃╰╮┃┣━━┳╯╰╮╱╱┃"
echo -e "\033[0;36m┃━┃╰┻━┃╰━╯┃┃━┃┃┣╱┳╯╭╮╰╮━┃"
echo -e "\033[0;37m┃╱╰━━━┻━━━┻╯╱╰━╯╱╰━╯╰━╯╱┃"
echo -e "\033[0;35m┣━━━━━━━━━━━━━━━━━━━━━━━╯"
echo -e "\033[0;37m╰━━Script BY GUN-X"
echo ""
echo -e "\033[1;31m[\033[1;36m20\033[1;31m] \033[1;37m• \033[1;31mเพิ่มโฮสต์ \033[1;31m              
[\033[1;36m21\033[1;31m] \033[1;37m• \033[1;32mลบโฮสต์ \033[1;31m          
[\033[1;36m22\033[1;31m] \033[1;37m• \033[1;33mรีบูตเซิร์ฟเวอร์ใหม่ \033[1;31m        
[\033[1;36m23\033[1;31m] \033[1;37m• \033[1;34mรีบูตระบบใหม่ \033[1;31m        
[\033[1;36m24\033[1;31m] \033[1;37m• \033[1;35mไฟร์วอลล์ $stsf\033[1;31m       
[\033[1;36m25\033[1;31m] \033[1;37m• \033[1;36mBOT TELEGRAM $stsbot\033[1;31m        
[\033[1;36m26\033[1;31m] \033[1;37m• \033[1;37mเปลี่ยนรหัสผ่าน Root \033[1;31m
[\033[1;36m27\033[1;31m] \033[1;37m• \033[1;31mเปิดเมนูอัตโนมัติเมื่อระบบ $autm \033[1;31m
[\033[1;36m28\033[1;31m] $var01 \033[1;31mอัปเดตสคริปต์ \033[1;31m
[\033[1;36m29\033[1;31m] \033[1;37m• \033[1;32mถอนการติดตั้งสคริปต์ \033[1;31m
[\033[1;36m30\033[1;31m] \033[1;37m• \033[1;33mย้อนกลับ \033[1;32m<\033[1;33m<\033[1;31m< \033[1;31m
[\033[1;36m00\033[1;31m] \033[1;37m• \033[1;34mออก \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -ne "\033[1;32mเลือกMENUที่ต้องการจะใช้\033[1;33m?\033[1;31m?\033[1;37m : "; read x
case "$x" in
   20)
   clear
   addhost
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   menu2
   ;;
   21)
   clear
   delhost
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   menu2
   ;;
   22)
   clear
   reiniciarsistema
   ;;
   23)
   clear
   reiniciarservicos
   sleep 3
   ;;
   24)
   blockt
   ;;
   25)
   botssh
   ;;
   26)
   clear
   senharoot
   sleep 3
   ;;
   27)
   autoexec
   ;;
   28)
   attscript
   ;;
   29)
   clear
   delscript
   ;;
   30)
   menu
   ;;
   0|00)
   echo -e "\033[1;31mGoing out...\033[0m"
   sleep 2
   clear
   exit;
   ;;
   *)
   echo -e "\n\033[1;31mInvalid option !\033[0m"
   sleep 2
esac
}
while true $x != "ok"
do
stsl=$(ps x | grep "limiter"|grep -v grep > /dev/null && echo -e "\033[1;32m◉ " || echo -e "\033[1;31m○ ")
stsu=$(ps x | grep "udpvpn"|grep -v grep > /dev/null && echo -e "\033[1;32m◉ " || echo -e "\033[1;31m○ ")
if [[ "$(grep -c "Ubuntu" /etc/issue.net)" = "1" ]]; then
system=$(cut -d' ' -f1 /etc/issue.net)
system+=$(echo ' ')
system+=$(cut -d' ' -f2 /etc/issue.net |awk -F "." '{print $1}')
elif [[ "$(grep -c "Debian" /etc/issue.net)" = "1" ]]; then
system=$(cut -d' ' -f1 /etc/issue.net)
system+=$(echo ' ')
system+=$(cut -d' ' -f3 /etc/issue.net)
else
system=$(cut -d' ' -f1 /etc/issue.net)
fi
_ons=$(ps -x | grep sshd | grep -v root | grep priv | wc -l)
[[ "$(cat /etc/SSHPlus/Exp)" != "" ]] && _expuser=$(cat /etc/SSHPlus/Exp) || _expuser="0"
[[ -e /etc/openvpn/openvpn-status.log ]] && _onop=$(grep -c "10.8.0" /etc/openvpn/openvpn-status.log) || _onop="0"
[[ -e /etc/default/dropbear ]] && _drp=$(ps aux | grep dropbear | grep -v grep | wc -l) _ondrp=$(($_drp - 1)) || _ondrp="0"
_onli=$(($_ons + $_onop + $_ondrp))
_ram=$(printf ' %-9s' "$(free -h | grep -i mem | awk {'print $2'})")
_usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
_usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
_core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
_system=$(printf '%-14s' "$system")
_hora=$(printf '%(%H:%M:%S)T')
_onlin=$(printf '%-5s' "$_onli")
_userexp=$(printf '%-5s' "$_expuser")
_tuser=$(awk -F: '$3>=1000 {print $1}' /etc/passwd | grep -v nobody | wc -l)
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[41;1;37m               ⇱ SSHPLUS MANAGER ⇲                \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;32mระบบ               หน่วยความจำ         โปรเซสเซอร์ "
echo -e "\033[1;31mOS: \033[1;37m$_system \033[1;31mTotal:\033[1;37m$_ram \033[1;31mCPU: \033[1;37m$_core\033[0m"
echo -e "\033[1;31mTime: \033[1;37m$_hora     \033[1;31mIn Use: \033[1;37m$_usor \033[1;31mIn Use: \033[1;37m$_usop\033[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;32mออนไลน์:\033[1;37m $_onlin     \033[1;31m หมดอายุ: \033[1;37m$_userexp \033[1;33mบัญชีทั้งหมด: \033[1;37m$_tuser\033[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[0;31m╭━━━━━━━━━━━━━━━━━━━━━━━╮"
echo -e "\033[0;32m┃━╭━━━┳╮━╭┳━╮━╭╮━╭━╮╭━╮━┃"
echo -e "\033[0;33m┃╱┃╭━╮┃┃╱┃┃╱╰╮┃┃╱╰╮╰╯╭╯╱┃"
echo -e "\033[0;34m┃━┃┃━╰┫┃━┃┃╭╮╰╯┃━━╰╮╭╯━━┃"
echo -e "\033[0;35m┃╱┃┃╭━┫┃╱┃┃┃╰╮┃┣━━┳╯╰╮╱╱┃"
echo -e "\033[0;36m┃━┃╰┻━┃╰━╯┃┃━┃┃┣╱┳╯╭╮╰╮━┃"
echo -e "\033[0;37m┃╱╰━━━┻━━━┻╯╱╰━╯╱╰━╯╰━╯╱┃"
echo -e "\033[0;35m┣━━━━━━━━━━━━━━━━━━━━━━━╯"
echo -e "\033[0;37m╰━━Script BY GUN-X"
echo ""
echo -e "\033[1;31m[\033[1;36m01\033[1;31m] \033[1;37m• \033[1;31mสร้างผู้ใช้SSH & OPENVPN \033[1;31m                    
[\033[1;36m02\033[1;31m] \033[1;37m• \033[1;32mสร้างบัญชี ทดลอง \033[1;31m              
[\033[1;36m03\033[1;31m] \033[1;37m\033[1;37m• \033[1;33mลบผู้ใช้ \033[1;31m                    
[\033[1;36m04\033[1;31m] \033[1;37m• \033[1;34mตรวจสอบผู้ใช้ที่ออนไลน์ \033[1;31m                 
[\033[1;36m05\033[1;31m] \033[1;37m• \033[1;35mเปลี่ยนวันที่ \033[1;31m                    
[\033[1;36m06\033[1;31m] \033[1;37m• \033[1;36mเปลี่ยนจำกัดการเชื่อมต่อ \033[1;31m                   
[\033[1;36m07\033[1;31m] \033[1;37m• \033[1;31mเปลี่ยนรหัสผ่าน \033[1;31m                
[\033[1;36m08\033[1;31m] \033[1;37m• \033[1;32mลบบัญชี้ผู้ใช้ที่หมดอายุ \033[1;31m                 
[\033[1;36m09\033[1;31m] \033[1;37m• \033[1;33mผู้ใช้ทั้งหมด \033[1;31m                    
[\033[1;36m10\033[1;31m] \033[1;37m• \033[1;34mตั้งค่าระบบต่างๆ \033[1;31m                
[\033[1;36m11\033[1;31m] \033[1;37m• \033[1;35mเทสสปีดความเร็ว \033[1;31m
[\033[1;36m12\033[1;31m] \033[1;37m• \033[1;36mใส่เครดิต SSH \033[1;31m
[\033[1;36m13\033[1;31m] \033[1;37m• \033[1;31mDATA ข้อมูล \033[1;31m
[\033[1;36m14\033[1;31m] \033[1;37m• \033[1;32mเพิ่มประสิทธิภาพ \033[1;31m
[\033[1;36m15\033[1;31m] \033[1;37m• \033[1;33mสำรองผู้ใช้ \033[1;31m
[\033[1;36m16\033[1;31m] \033[1;37m• \033[1;34mจำกัดการเชื่อต่อ $stsl\033[1;31m
[\033[1;36m17\033[1;31m] \033[1;37m• \033[1;35mBAD VPN $stsu\033[1;31m
[\033[1;36m18\033[1;31m] \033[1;37m• \033[1;36mข้อมูล VPS \033[1;31m
[\033[1;36m19\033[1;31m] \033[1;37m• \033[1;31mเมนูเพิ่มเติม \033[1;31m>\033[1;33m>\033[1;32m>\033[0m\033[1;31m
[\033[1;36m00\033[1;31m] \033[1;37m• \033[1;37mออก MENU \033[1;32m<\033[1;33m<\033[1;31m<\033[0m \033[0m"
echo ""
echo ""
echo -ne "\033[1;32mเลือกMENUที่ต้องการจะใช้\033[1;33m?\033[1;31m?\033[1;37m : "; read x

case "$x" in 
   1 | 01)
   clear
   criarusuario
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   ;;
   2 | 02)
   clear
   criarteste
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   ;;
   3 | 03)
   clear
   remover
   sleep 3
   ;;
   4 | 04)
   clear
   sshmonitor
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   ;;      
   5 | 05)
   clear
   mudardata
   sleep 3
   ;;
   6 | 06)
   clear
   alterarlimite
   sleep 3
   ;; 
   7 | 07)
   clear
   alterarsenha
   sleep 3
   ;;
   8 | 08)
   clear
   expcleaner
   echo ""
   sleep 3
   ;;     
   9 | 09)
   clear
   infousers
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   ;;
   10)
   conexao
   exit;
   ;;
   11)
   clear
   velocity
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   ;;
   12)
   clear
   banner
   sleep 3
   ;;
   13)
   clear
   echo -e "\033[1;32mTO EXIT CLICK CTRL + C\033[1;36m"
   sleep 4
   nload
   ;;
   14)
   clear
   otimizar
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   ;;
   15)
   userbackup
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   ;;
   16)
   limit_ssh
   ;;
   17)
   clear
   badvpn
   exit;
   ;;
   18)
   clear
   detalhes
   echo -ne "\n\033[1;31mPRESS ENTER \033[1;33mto return in \033[1;32mMENU!\033[0m"; read
   ;;
   19)
   menu2
   ;;
   0 | 00)
   echo -e "\033[1;31mGoing out...\033[0m"
   sleep 2
   clear
   exit;
   ;;
   *)
   echo -e "\n\033[1;31mInvalid option !\033[0m"
   sleep 2
esac
done
}
menu
#fim
