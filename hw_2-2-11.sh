#!/bin/bash
# Author: Mia
# Version: v1.00

# 參數傳遞
amount=$1          # 貸款金額
rate=$2            # 年利率（%）
months=$3          # 還款期數（月）
method=$4          # 償還方式：equal 或 principal

# 檢查參數完整性
if [[ -z "$amount" || -z "$rate" || -z "$months" || -z "$method" ]]; then
    echo "Usage: $0 <amount> <annual_rate_%> <months> <equal|principal>"
    exit 1
fi

# 利率處理
monthly_rate=$(echo "scale=10; $rate / 12 / 100" | bc)

echo "貸款金額：$amount 元"
echo "年利率：$rate%"
echo "期數：$months 個月"
echo "償還方式：$method"
echo "----------------------------------"

if [[ "$method" == "equal" ]]; then
    # 本息平均 (等額本息)
    numerator=$(echo "scale=10; $amount * $monthly_rate * (1 + $monthly_rate)^$months" | bc -l)
    denominator=$(echo "scale=10; (1 + $monthly_rate)^$months - 1" | bc -l)
    monthly_payment=$(echo "scale=2; $numerator / $denominator" | bc -l)

    total_payment=$(echo "scale=2; $monthly_payment * $months" | bc)
    interest=$(echo "scale=2; $total_payment - $amount" | bc)

    echo "每月還款：$monthly_payment 元"
    echo "總利息：$interest 元"
    echo "總還款金額：$total_payment 元"

elif [[ "$method" == "principal" ]]; then
    # 本金平均
    principal_per_month=$(echo "scale=2; $amount / $months" | bc)
    echo "每月應付本金：$principal_per_month 元"
    echo "月\t利息\t\t總付款"

    total_interest=0

    for ((i=1; i<=months; i++)); do
        remaining=$(echo "$amount - $principal_per_month * ($i - 1)" | bc)
        interest_month=$(echo "scale=2; $remaining * $monthly_rate" | bc)
        payment=$(echo "scale=2; $principal_per_month + $interest_month" | bc)
        printf "%d\t%s\t\t%s\n" "$i" "$interest_month" "$payment"
        total_interest=$(echo "$total_interest + $interest_month" | bc)
    done

    total_payment=$(echo "$amount + $total_interest" | bc)
    echo "總利息：$total_interest 元"
    echo "總還款金額：$total_payment 元"

else
    echo "錯誤：償還方式請使用 equal 或 principal"
    exit 1
fi

exit 0
