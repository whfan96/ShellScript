#!/bin/bash
# Author: Mia
# Version: v1.00

count=1

while [ $count -le 3 ]; do
    read -p "請輸入第 $count 個指令： " cmd

    if [ -n "$cmd" ]; then
        echo -e "\a▶ 執行第 $count 個指令：$cmd"

        eval "$cmd" 2>/dev/null  # 執行指令，錯誤訊息導向 /dev/null
        if [ $? -ne 0 ]; then
            echo "⚠ 第 $count 個指令執行失敗！"
        fi
    else
        echo "❌ 請勿空白，請重新輸入！"
        continue
    fi

    count=$((count + 1))
done
