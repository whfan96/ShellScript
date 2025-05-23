#!/bin/bash
# Author: Mia
# Version: v1.00
# 主程式，讀入輸入並呼叫 powerCalc.sh

read -p "Enter base number (n): " n
read -p "Enter exponent (m): " m

# 呼叫 powerCalc.sh，並將結果儲存
result=$(./powerCalc.sh "$n" "$m")

# 若計算成功則顯示結果
if [[ $? -eq 0 ]]; then
    echo "[DONE] : $n^$m is $result"
else
    echo "[ERROR] Failed to calculate power."
    exit 1
fi

exit 0
