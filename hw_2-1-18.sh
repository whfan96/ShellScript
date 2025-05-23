#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "Enter your birth year (e.g. 1990): " year

# 確認輸入為數字
if ! [[ "$year" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid year."
    exit 1
fi

# 計算與生肖對應的索引 (以 2020 為鼠年基準年)
index=$(( (year - 2020) % 12 ))
# 修正負數餘數（bash 的 % 可能會有負數）
if (( index < 0 )); then
    index=$(( index + 12 ))
fi

# 根據餘數對應生肖
case $index in
    0)  animal="Rat" ;;
    1)  animal="Ox" ;;
    2)  animal="Tiger" ;;
    3)  animal="Rabbit" ;;
    4)  animal="Dragon" ;;
    5)  animal="Snake" ;;
    6)  animal="Horse" ;;
    7)  animal="Goat" ;;
    8)  animal="Monkey" ;;
    9)  animal="Rooster" ;;
    10) animal="Dog" ;;
    11) animal="Pig" ;;
esac

echo "Your Chinese zodiac sign is: $animal"
exit 0
