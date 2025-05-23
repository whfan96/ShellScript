#!/bin/bash
# Description: 計算指定日期為星期幾 (不使用 date 指令)
# Author: Mia Fan
# Version: v1.00

# function：Zeller's Congruence 計算星期幾
# 傳入：年、月、日
get_day_of_week() {
    local y=$1
    local m=$2
    local d=$3

    # 若是 1 月或 2 月，視為前一年之 13、14 月
    if [[ $m -lt 3 ]]; then
        m=$((m + 12))
        y=$((y - 1))
    fi

    local k=$((y % 100))       # 年的後兩位數
    local j=$((y / 100))       # 世紀數

    # Zeller's formula：h = (d + 13(m+1)/5 + k + k/4 + j/4 + 5j) % 7
    local h=$(( (d + (13*(m+1))/5 + k + k/4 + j/4 + 5*j) % 7 ))

    # h = 0 為 Saturday，1=Sunday，...，6=Friday
    case $h in
        0) echo "星期六" ;;
        1) echo "星期日" ;;
        2) echo "星期一" ;;
        3) echo "星期二" ;;
        4) echo "星期三" ;;
        5) echo "星期四" ;;
        6) echo "星期五" ;;
    esac
}

# 主流程
read -p "請輸入日期 (格式：YYYY/MM/DD)： " input

# 確認格式正確
if [[ ! "$input" =~ ^[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}$ ]]; then
    echo "[錯誤] 請輸入正確格式如 2025/05/19"
    exit 1
fi

# 拆解年月日
year=$(echo $input | cut -d/ -f1)
month=$(echo $input | cut -d/ -f2)
day=$(echo $input | cut -d/ -f3)

# 呼叫 function 輸出結果
echo -n "→ $year/$month/$day 是 "
get_day_of_week $year $month $day

exit 0

