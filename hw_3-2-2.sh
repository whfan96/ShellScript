#!/bin/bash
# Description: Generate 30 unique random numbers between 250 and 500
# Author: Mia
# Version: v1.00

min=250
max=500
count=30
declare -a randArray

while [ ${#randArray[@]} -lt $count ]; do
    rand=$((RANDOM % (max - min + 1) + min))

    # 檢查是否重複
    duplicate=0
    for num in "${randArray[@]}"; do
        if [[ "$num" -eq "$rand" ]]; then
            duplicate=1
            break
        fi
    done

    # 不重複才加入
    if [ $duplicate -eq 0 ]; then
        randArray+=($rand)
    fi
done

# 輸出結果
echo "🎲 產生的亂數如下："
echo "${randArray[@]}"
exit 0
