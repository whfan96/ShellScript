#!/bin/bash
# Author: Mia
# Version: v1.00

# 提示使用者輸入
read -p "請輸入身高 (cm): " height
read -p "請輸入體重 (kg): " weight

# 檢查是否為數字
if ! [[ "$height" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$weight" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "請輸入有效的數字格式"
    exit 1
fi

# 呼叫 bmi.sh 並傳遞參數
./bmi.sh "$height" "$weight"
exit 0
