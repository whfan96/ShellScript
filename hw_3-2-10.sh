#!/bin/bash
# Description: 飲料結帳系統，列印帳單並存檔。
# Author: Mia
# Version: v1.00

storeName="OpenAI Tea Shop"
dateTime=$(date '+%Y-%m-%d %H:%M:%S')
fileTime=$(date '+%Y%m%d_%H%M%S')
billFile="drink_bill_$fileTime.txt"

# 飲料選項
declare -a drinks=("紅茶" "綠茶" "奶茶" "珍奶" "冬瓜茶")
declare -a prices=(25 25 35 45 30)

# 購買資料
declare -a cartItems=()
declare -a cartQty=()
declare -a cartTotal=()

clear
echo "==== $storeName 飲料點餐機 ===="
echo "請選擇飲料並輸入數量，輸入 0 結帳。"

while true; do
    echo -e "\n------ 菜單 ------"
    for i in "${!drinks[@]}"; do
        printf " (%d) %-10s NT$%d\n" $((i+1)) "${drinks[$i]}" "${prices[$i]}"
    done
    echo " (0) 結帳"

    read -p "請選擇飲料編號（0結帳）： " choice
    [[ "$choice" =~ ^[0-5]$ ]] || { echo "請輸入 0 ~ ${#drinks[@]} 的數字"; continue; }

    if [ "$choice" == "0" ]; then
        break
    fi

    index=$((choice - 1))
    read -p "請輸入 ${drinks[$index]} 的數量： " qty
    [[ "$qty" =~ ^[1-9][0-9]*$ ]] || { echo "數量需為正整數"; continue; }

    total=$(( qty * prices[$index] ))
    cartItems+=("${drinks[$index]}")
    cartQty+=("$qty")
    cartTotal+=("$total")

    echo "✅ 已加入：${drinks[$index]} x $qty，共 NT\$${total}"
done

# 印出帳單
echo -e "\n===== 結帳明細 ====="
echo "$storeName" | tee "$billFile"
echo "時間：$dateTime" | tee -a "$billFile"
echo "--------------------------" | tee -a "$billFile"
printf "%-10s %5s %5s %6s\n" "品項" "單價" "數量" "小計" | tee -a "$billFile"
echo "--------------------------" | tee -a "$billFile"

sum=0
for i in "${!cartItems[@]}"; do
    printf "%-10s %5d %5d %6d\n" "${cartItems[$i]}" "${prices[$i]}" "${cartQty[$i]}" "${cartTotal[$i]}" | tee -a "$billFile"
    sum=$(( sum + cartTotal[$i] ))
done

echo "--------------------------" | tee -a "$billFile"
echo "總金額：NT$ $sum" | tee -a "$billFile"
echo "===========================" | tee -a "$billFile"

echo -e "\n✅ 帳單已儲存：$billFile"

