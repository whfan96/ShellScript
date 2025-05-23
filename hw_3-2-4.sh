#!/bin/bash
#Description: Check lan host exists.
#Write by 350 & Mia
#Version: v2.00 - 支援使用者輸入網段與起訖 IP

echo "==== LAN HOST CHECKER ===="

read -p "請輸入網段 (例如 192.168.91): " netSegment
read -p "請輸入起始 IP (例如 1): " startIP
read -p "請輸入結束 IP (例如 20): " endIP

# 簡單檢查輸入格式是否合理
if ! [[ $netSegment =~ ^([0-9]{1,3}\.){2}[0-9]{1,3}$ ]]; then
    echo "[錯誤] 網段格式錯誤，應為 x.x.x"
    exit 1
fi

if ! [[ $startIP =~ ^[0-9]+$ ]] || ! [[ $endIP =~ ^[0-9]+$ ]]; then
    echo "[錯誤] 起始IP及結束IP需為數字"
    exit 1
fi

if [ $startIP -gt $endIP ]; then
    echo "[錯誤] 起始 IP 不能大於結束 IP"
    exit 1
fi

for ip in $(seq $startIP $endIP)
do
    fullIP="$netSegment.$ip"
    echo -n "pinging $fullIP... "
    ping -c 1 -i 0.2 -W 1 $fullIP &> /dev/null
    if [ $? -eq 0 ]; then
        echo "ONLINE."
    else
        echo ""
    fi
done

echo "======== SCAN END ========"

exit 0
