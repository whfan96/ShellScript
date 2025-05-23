#!/bin/bash
# Author: Mia
# Version: v1.00

unit=$1
value=$2

# 坪與平方公尺之間的換算比：1 坪 = 3.3058 平方公尺
case "$unit" in
    m2)
        ping=$(echo "scale=4; $value / 3.3058" | bc)
        echo "$value 平方公尺 約為 $ping 坪"
        ;;
    ping)
        m2=$(echo "scale=4; $value * 3.3058" | bc)
        echo "$value 坪 約為 $m2 平方公尺"
        ;;
    *)
        echo "未知單位：$unit"
        exit 1
        ;;
esac
exit 0