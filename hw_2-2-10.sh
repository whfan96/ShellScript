#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "請輸入貸款金額（元）: " amount
read -p "請輸入年利率（%）: " rate
read -p "請輸入貸款年數: " years
read -p "請選擇償還方式 (1=本息平均, 2=本金平均): " method

# 換算為期數與月利率
months=$((years * 12))
monthly_rate=$(echo "scale=10; $rate / 100 / 12" | bc)

# 轉換償還方式代碼
case "$method" in
    1) repayment="equal_principal_interest" ;;
    2) repayment="equal_principal" ;;
    *) echo "錯誤的償還方式，請輸入 1 或 2"; exit 1 ;;
esac

# 呼叫計算程式
./car_loan_calc.sh "$amount" "$monthly_rate" "$months" "$repayment"
exit 0

