#!/bin/bash
# Author: Mia
# Version: v1.00

# 輸入要轉換的單位
while true; do
    read -p "請輸入來源單位（m2=平方公尺 / ping=坪）: " unit
    unit=$(echo "$unit" | tr '[:upper:]' '[:lower:]')
    if [[ "$unit" == "m2" || "$unit" == "ping" ]]; then
        break
    else
        echo "單位輸入錯誤，請輸入 m2 或 ping。"
    fi
done

# 輸入數值
while true; do
    read -p "請輸入數值: " value
    if [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        break
    else
        echo "數值錯誤，請重新輸入數字。"
    fi
done

# 呼叫轉換程式
./area_converter.sh "$unit" "$value"
exit 0
