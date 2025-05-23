#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "下注金額：" bet
echo "按 Enter 開始擲骰…"
read

roll() {
    sum=0
    for i in {1..4}; do
        d=$((RANDOM%6+1))
        sum=$((sum+d))
    done
    echo $sum
}

player=$(roll)
dealer=$(roll)

echo "你擲出了 $player 點，莊家擲出 $dealer 點"
if (( player > dealer )); then
    echo "你贏了！贏得 $bet 元"
elif (( player < dealer )); then
    echo "你輸了！損失 $bet 元"
else
    echo "平手！"
fi
exit 0