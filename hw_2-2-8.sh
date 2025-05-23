#!/bin/bash
# Author: Mia
# Version: v1.00

# 反覆讀取並確認性別輸入為 M 或 F
while true; do
    read -p "請輸入性別（M=男, F=女）: " gender
    gender=$(echo "$gender" | tr '[:lower:]' '[:upper:]')
    if [[ "$gender" == "M" || "$gender" == "F" ]]; then
        break
    else
        echo "性別輸入錯誤，請輸入 M 或 F。"
    fi
done

# 讀取台灣鞋碼，驗證是否為有效數字（整數或小數）
while true; do
    read -p "請輸入台灣鞋碼（TW，單位 cm，例如 26 或 24.5）: " size
    if [[ "$size" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        break
    else
        echo "鞋碼格式錯誤，請重新輸入正確的數字（例如 24.5）"
    fi
done

# 呼叫被呼叫程式
./shoesize.sh "$gender" "$size"
exit 0
