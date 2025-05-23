#!/bin/bash
# Author: Mia
# Version: v1.00

echo "===== 主選單 ====="
echo "1) 顯示目前日期與時間"
echo "2) 顯示目前路徑"
echo "3) 顯示登入使用者"
echo "q) 離開選單"

read -p "請選擇一個選項: " choice

case "$choice" in
    1)
        echo "目前日期與時間為: $(date)"
        ;;
    2)
        echo "目前所在路徑為: $(pwd)"
        ;;
    3)
        echo "目前使用者為: $USER"
        ;;
    q|Q)
        echo "感謝使用，再見！"
        ;;
    *)
        echo "輸入錯誤，請選擇有效選項。"
        ;;
esac