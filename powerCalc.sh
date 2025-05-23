#!/bin/bash
# powerCalc.sh - 次方計算程式
# 傳入參數：$1 為底數，$2 為次方數
# 傳出：計算結果，經由 echo 輸出

base=$1
exp=$2

# 檢查是否為整數
if ! [[ $base =~ ^-?[0-9]+$ && $exp =~ ^[0-9]+$ ]]; then
    echo "Error: both arguments must be integers (exp must be ≥ 0)"
    exit 1
fi

# 計算次方
result=1
for ((i=0; i<exp; i++)); do
    result=$((result * base))
done

# 輸出結果
echo "$result"
exit 0
