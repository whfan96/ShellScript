#!/bin/bash
# Description: 1A2B 猜數字遊戲（修正 circular reference）
# Author: Mia
# Version: v1.2

# 產生 4 位不重複亂數
generate_answer() {
    local nums=()
    while [ ${#nums[@]} -lt 4 ]; do
        n=$((RANDOM % 10))
        if [[ ! " ${nums[@]} " =~ " $n " ]]; then
            nums+=($n)
        fi
    done
    echo "${nums[@]}"
}

# 比對幾A幾B
check_guess() {
    local A=0 B=0
    for i in {0..3}; do
        if [ "${guess[$i]}" == "${answer[$i]}" ]; then
            ((A++))
        elif [[ " ${answer[@]} " =~ " ${guess[$i]} " ]]; then
            ((B++))
        fi
    done
    echo "${A}A${B}B"
}

# 主程式開始
echo "==== 1A2B 猜數字遊戲 ===="
echo "請猜 4 位數不重複的數字，例如：1234"

# 修正：使用 read -a 接收陣列
read -a answer <<< "$(generate_answer)"
# echo "DEBUG: 答案是 ${answer[@]}"

count=0
history=()

while true; do
    read -p "請輸入你的猜測： " input

    [[ ! "$input" =~ ^[0-9]{4}$ ]] && echo "請輸入 4 位數字。" && continue

    uniq_check=$(echo "$input" | grep -o . | sort | uniq | wc -l)
    [[ $uniq_check -ne 4 ]] && echo "數字不可重複！" && continue

    ((count++))

    guess=()
    for ((i=0; i<4; i++)); do
        guess+=(${input:i:1})
    done

    result=$(check_guess)
    history+=("$input => $result")
    echo "結果：$result"

    [[ "$result" == "4A0B" ]] && break
done

echo -e "\n🎉 恭喜猜中！共猜了 $count 次。\n"
echo "==== 猜測歷程 ===="
for line in "${history[@]}"; do
    echo "$line"
done

exit 0

