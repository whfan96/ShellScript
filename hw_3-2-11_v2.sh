#!/bin/bash
# Description: 木材裁切最佳化程式（附詳細分配資訊）
# Author: Mia Fan

LOG_FILE="cut_log_$(date +%Y%m%d_%H%M%S).txt"
WOOD_LENGTH=1200  # 每支木材長度（公分）

declare -a LENGTHS
declare -a COUNTS
declare -a STOCKS  # 儲存目前每支木材的剩餘長度
declare -a CUTS    # 儲存每支木材的切割記錄（字串）

echo "=== 木材裁切最佳化系統 ==="
echo "請輸入每種需求的『長度』與『數量』（單位：cm），輸入 END 結束輸入。"

while true; do
    read -p "請輸入需求長度 (cm)： " length
    [[ "$length" == "END" ]] && break
    read -p "請輸入此長度數量： " count
    LENGTHS+=($length)
    COUNTS+=($count)
done

# 將長度從大排到小（Greedy）
for ((i=0; i<${#LENGTHS[@]}; i++)); do
    for ((j=i+1; j<${#LENGTHS[@]}; j++)); do
        if [ ${LENGTHS[i]} -lt ${LENGTHS[j]} ]; then
            # swap LENGTHS
            tmp=${LENGTHS[i]}; LENGTHS[i]=${LENGTHS[j]}; LENGTHS[j]=$tmp
            # swap COUNTS
            tmp=${COUNTS[i]}; COUNTS[i]=${COUNTS[j]}; COUNTS[j]=$tmp
        fi
    done
done

# 切割邏輯
totalWaste=0
for ((i=0; i<${#LENGTHS[@]}; i++)); do
    length=${LENGTHS[i]}
    count=${COUNTS[i]}

    for ((c=0; c<count; c++)); do
        placed=0
        for ((j=0; j<${#STOCKS[@]}; j++)); do
            if [ ${STOCKS[j]} -ge $length ]; then
                STOCKS[j]=$((STOCKS[j]-length))
                CUTS[j]="${CUTS[j]} ${length}"
                placed=1
                break
            fi
        done

        if [ $placed -eq 0 ]; then
            STOCKS+=($((WOOD_LENGTH - length)))
            CUTS+=("$length")
        fi
    done
done

# 輸出每支木材的使用情形
echo -e "\n=== 詳細裁切資訊 ==="
for ((i=0; i<${#STOCKS[@]}; i++)); do
    echo "第 $((i+1)) 支木材：切割長度 ->${CUTS[i]}｜剩餘：${STOCKS[i]} cm"
    totalWaste=$((totalWaste + STOCKS[i]))
done

# 統計總數
echo -e "\n=== 統計結果 ==="
echo "總共需要圓木：${#STOCKS[@]} 支"
echo "總廢料：${totalWaste} 公分（約 $(bc <<< "scale=2; $totalWaste/100") 公尺）"

exit 0

