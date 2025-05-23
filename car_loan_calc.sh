#!/bin/bash
# Author: Mia
# Version: v1.00

amount=$1
monthly_rate=$2
months=$3
method=$4

echo "貸款金額: $amount 元"
echo "期數: $months 月"
echo "月利率: $monthly_rate"

case "$method" in
    equal_principal_interest)
        # 本息平均攤還：每月還款金額公式
        monthly_payment=$(echo "scale=2; $amount * $monthly_rate * (1 + $monthly_rate)^$months / ((1 + $monthly_rate)^$months - 1)" | bc -l)
        total=$(echo "$monthly_payment * $months" | bc)
        interest_total=$(echo "$total - $amount" | bc)
        echo "每月應繳: $monthly_payment 元"
        echo "總利息: $interest_total 元"
        ;;
    equal_principal)
        # 本金平均攤還
        principal_month=$(echo "scale=2; $amount / $months" | bc)
        total_interest=0
        echo "每月本金固定: $principal_month 元"
        echo "每月利息與總還款明細如下："
        for ((i=0; i<months; i++)); do
            remaining=$(echo "$amount - $principal_month * $i" | bc)
            interest=$(echo "scale=2; $remaining * $monthly_rate" | bc)
            payment=$(echo "$principal_month + $interest" | bc)
            total_interest=$(echo "$total_interest + $interest" | bc)
            printf "第 %2d 期: 利息: %8s, 總繳: %8s\n" "$((i+1))" "$interest" "$payment"
        done
        echo "總利息: $total_interest 元"
        ;;
    *)
        echo "不支援的償還方式"
        exit 1
        ;;
esac
exit 0