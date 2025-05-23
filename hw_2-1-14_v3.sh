#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "請輸入框的高度（最少 3，預設 8）： " height

# 如果沒輸入就使用預設值
if [[ -z "$height" ]]; then
    height=8
fi

# 檢查是否合法
if [[ "$height" -lt 3 ]]; then
    echo "錯誤：高度不能小於 3！"
    exit 1
fi

# 畫出框框
for ((i=1; i<=height; i++)); do
    if [[ $i -eq 1 || $i -eq $height ]]; then
        echo "＊＊＊＊＊＊＊＊"
    else
        echo "＊　　　　　　＊"
    fi
done

exit 0

