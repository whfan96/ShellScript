#!/bin/bash
# Description: Use parameters to design an adder program with numeric check.
# Author: Mia Fan
# Version: v1.10 - Add input validation for numbers

# 檢查是否有兩個參數
[ -z "$2" ] && echo "[USAGE] $0 <number1> <number2>" && exit 1

# 檢查兩個參數是否都是純數字（含正整數與 0）
if ! [[ "$1" =~ ^-?[0-9]+$ && "$2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Both arguments must be valid integers."
    exit 1
fi

# 執行加總
echo "$1 + $2 = $(expr $1 + $2)"

exit 0

