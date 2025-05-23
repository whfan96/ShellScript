#!/bin/bash
# Description: 木材裁切最佳化
# Version: v1.00

totalLength=1200  # 每根圓木為 12 米（單位：公分）
declare -a lengths
declare -a quantities

echo "=== 木材裁切最佳化系統 ==="
echo "請輸入每種需求的『長度』與『數量』（單位：cm），輸入 END 結束輸入。"

# 資料輸入
while true; do
    read -p "請輸入需求長度 (cm)：" len
    [ "$len" == "END" ] && break
    read -p "請輸入此長度數量：" qty

    lengths+=("$len")
    quantities+=("$qty")
done

# 展開需求成單一段長度的列表
declare -a allCuts
for ((i=0; i<${#lengths[@]}; i++)); do
    for ((j=0; j<${quantities[i]}; j++)); do
        allCuts+=("${lengths[i]}")
    done
done

# 按長度由大到小排序
IFS=$'\n' sortedCuts=($(sort -nr <<<"${allCuts[*]}"))
unset IFS

# 開始裁切（模擬）
declare -a logs   # 每根圓木剩餘長度
logCount=0

for cut in "${sortedCuts[@]}"; do
    fit=0
    for ((i=0; i<logCount; i++)); do
        if (( logs[i] >= cut )); then
            logs[i]=$(( logs[i] - cut ))
            fit=1
            break
        fi
    done

    if (( fit == 0 )); then
        logs[logCount]=$(( totalLength - cut ))
        logCount=$((logCount + 1))
    fi
done

# 統計廢料
totalWaste=0
for left in "${logs[@]}"; do
    totalWaste=$(( totalWaste + left ))
done

echo ""
echo "=== 統計結果 ==="
echo "總共需要圓木：$logCount 支"
echo "總廢料：$totalWaste 公分（約 $(awk "BEGIN{printf \"%.2f\", $totalWaste/100}") 公尺）"

