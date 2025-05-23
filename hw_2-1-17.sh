#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "Enter your birth month (1-12): " month
read -p "Enter your birth day (1-31): " day

# 檢查是否為數字
if ! [[ "$month" =~ ^[0-9]+$ && "$day" =~ ^[0-9]+$ ]]; then
    echo "Please enter valid numbers."
    exit 1
fi

# 檢查月份是否合理
if ((month < 1 || month > 12)); then
    echo "Invalid month."
    exit 1
fi

# 根據月份設定最大天數
case $month in
    1|3|5|7|8|10|12) max_day=31 ;;
    4|6|9|11) max_day=30 ;;
    2) max_day=29 ;;  # 不處理閏年，最大為 29
esac

# 檢查日期是否在最大值內
if ((day < 1 || day > max_day)); then
    echo "Invalid day for the selected month."
    exit 1
fi

# 星座判斷
case $month in
1)  sign=$([[ $day -le 19 ]] && echo "Capricorn" || echo "Aquarius") ;;
2)  sign=$([[ $day -le 18 ]] && echo "Aquarius" || echo "Pisces") ;;
3)  sign=$([[ $day -le 20 ]] && echo "Pisces" || echo "Aries") ;;
4)  sign=$([[ $day -le 19 ]] && echo "Aries" || echo "Taurus") ;;
5)  sign=$([[ $day -le 20 ]] && echo "Taurus" || echo "Gemini") ;;
6)  sign=$([[ $day -le 21 ]] && echo "Gemini" || echo "Cancer") ;;
7)  sign=$([[ $day -le 22 ]] && echo "Cancer" || echo "Leo") ;;
8)  sign=$([[ $day -le 22 ]] && echo "Leo" || echo "Virgo") ;;
9)  sign=$([[ $day -le 22 ]] && echo "Virgo" || echo "Libra") ;;
10) sign=$([[ $day -le 23 ]] && echo "Libra" || echo "Scorpio") ;;
11) sign=$([[ $day -le 22 ]] && echo "Scorpio" || echo "Sagittarius") ;;
12) sign=$([[ $day -le 21 ]] && echo "Sagittarius" || echo "Capricorn") ;;
esac

echo "Your zodiac sign is: $sign"
exit 0
