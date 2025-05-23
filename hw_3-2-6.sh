#!/bin/bash
# Description: 49選6 大樂透電腦選號投注程式
# Author: Mia
# Version: v1.0

# 產生一組 1~49 不重複亂數，共6個
generate_lottery_numbers() {
    local numbers=()
    while [ ${#numbers[@]} -lt 6 ]; do
        num=$(( RANDOM % 49 + 1 ))
        # 檢查是否已存在
        if [[ ! " ${numbers[*]} " =~ " $num " ]]; then
            numbers+=($num)
        fi
    done
    # 排序輸出
    IFS=$'\n' sorted=($(sort -n <<<"${numbers[*]}"))
    unset IFS
    echo "${sorted[*]}"
}

echo "=== 49選6 大樂透電腦選號 ==="
read -p "請輸入購買組數 (預設1組): " group_num
group_num=${group_num:-1}

echo "您選擇購買 $group_num 組號碼："
for ((i=1; i<=group_num; i++)); do
    nums=$(generate_lottery_numbers)
    echo "第 $i 組: $nums"
done
exit 0
