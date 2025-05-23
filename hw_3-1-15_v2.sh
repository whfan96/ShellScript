#!/bin/bash
# Author: Mia
# Version: v1.00

PS3="請選擇操作："

show_date() {
    date
}

show_uptime() {
    uptime
}

select choice in 顯示時間 顯示開機時間 結束
do
    case $REPLY in
        1) show_date ;;
        2) show_uptime ;;
        3) echo "再見！"; break ;;
        *) echo "錯誤選擇，請輸入 1~3" ;;
    esac
done
