#!/bin/bash
# Author: Mia
# Version: v1.00
# 18啦骰子遊戲（四顆）

money=1000  # 初始金額

roll_dice() {
    local sum=0
    local dice=()
    for ((i=0; i<4; i++)); do
        d=$((RANDOM % 6 + 1))
        dice+=($d)
        ((sum += d))
    done
    echo "${dice[*]}|$sum"
}

echo "🎲 歡迎來玩 18啦（四顆骰子）！你有 \$${money} 元。"
echo "輸入 q 可隨時離開遊戲。"

while [ $money -gt 0 ]; do
    echo "=============================="
    read -p "請輸入下注金額（目前 \$${money}）： " bet

    # 離開遊戲
    [[ "$bet" == "q" ]] && echo "👋 感謝遊玩，再見！" && break

    # 驗證下注金額是否為數字
    if ! [[ "$bet" =~ ^[0-9]+$ ]]; then
        echo "❌ 請輸入正整數金額。"
        continue
    fi

    # 驗證下注金額範圍
    if (( bet <= 0 || bet > money )); then
        echo "❌ 下注金額不合法，請重新輸入。"
        continue
    fi

    echo "🎯 按 Enter 擲骰子！"
    read

    echo "你擲出："
    player_result=$(roll_dice)
    player_dice=(${player_result%%|*})
    player_total=${player_result##*|}
    echo "🎲 ${player_dice[@]} → 總和 $player_total"

    sleep 1

    echo "莊家擲出："
    dealer_result=$(roll_dice)
    dealer_dice=(${dealer_result%%|*})
    dealer_total=${dealer_result##*|}
    echo "🎲 ${dealer_dice[@]} → 總和 $dealer_total"

    # 比較點數
    if (( player_total > dealer_total )); then
        echo "✅ 你贏了！獲得 \$${bet}"
        ((money += bet))
    elif (( player_total < dealer_total )); then
        echo "❌ 你輸了！損失 \$${bet}"
        ((money -= bet))
    else
        echo "🤝 平手！金額不變。"
    fi

    # 判斷是否破產
    if (( money == 0 )); then
        echo "💸 你破產了！遊戲結束。"
        break
    fi
done

exit 0
