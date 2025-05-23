#!/bin/bash
# Author: Mia
# Version: v1.00

# 讀取使用者輸入
read -p "請輸入菱形高度（奇數，最小3，預設7）: " height

# 若未輸入，預設為7
if [[ -z "$height" ]]; then
    height=7
fi

# 檢查是否為奇數且大於等於 3
if ! [[ "$height" =~ ^[0-9]+$ ]] || (( height < 3 || height % 2 == 0 )); then
    echo "請輸入一個大於等於 3 的奇數"
    exit 1
fi

# 計算中間行（對稱中心）
mid=$((height / 2))

# 上半部（含中間行）
for ((i=0; i<=mid; i++)); do
    spaces=$i
    stars=$(((mid - i + 1) * 2))
    for ((s=0; s<spaces; s++)); do
        printf "　"   # 全形空白
    done
    for ((j=0; j<stars; j++)); do
        printf "＊"
    done
    echo
done

# 下半部
for ((i=mid-1; i>=0; i--)); do
    spaces=$i
    stars=$(((mid - i + 1) * 2))
    for ((s=0; s<spaces; s++)); do
        printf "　"
    done
    for ((j=0; j<stars; j++)); do
        printf "＊"
    done
    echo
done

exit 0