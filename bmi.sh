#!/bin/bash
# Author: Mia
# Version: v1.00

# 檢查參數是否足夠
if [[ $# -lt 2 ]]; then
    echo "用法: $0 身高(cm) 體重(kg)"
    exit 1
fi

height_cm=$1
weight_kg=$2

# 將身高轉為公尺
height_m=$(echo "scale=2; $height_cm / 100" | bc)

# 計算 BMI：體重 ÷ 身高平方
bmi=$(echo "scale=2; $weight_kg / ($height_m * $height_m)" | bc)

# 顯示結果與評估
echo "你的 BMI 為：$bmi"

# BMI 評估邏輯
if (( $(echo "$bmi < 18.5" | bc -l) )); then
    echo "體重過輕"
elif (( $(echo "$bmi >= 18.5 && $bmi < 24" | bc -l) )); then
    echo "正常範圍"
elif (( $(echo "$bmi >= 24 && $bmi < 27" | bc -l) )); then
    echo "過重"
elif (( $(echo "$bmi >= 27 && $bmi < 30" | bc -l) )); then
    echo "輕度肥胖"
elif (( $(echo "$bmi >= 30 && $bmi < 35" | bc -l) )); then
    echo "中度肥胖"
else
    echo "重度肥胖"
fi
exit 0