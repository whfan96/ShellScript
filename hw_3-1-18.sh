#!/bin/bash
# Description: 成績合格統計程式
# Author: Mia Fan
# Version: 1.0

declare -a scores
index=0

echo "請依序輸入學生成績，輸入 END 結束："

# 使用 while 輸入成績
while true; do
    read -p "第 $((index + 1)) 位學生成績：" input
    if [[ "$input" == "END" ]]; then
        break
    elif [[ "$input" =~ ^[0-9]+$ && $input -ge 0 && $input -le 100 ]]; then
        scores[$index]=$input
        ((index++))
    else
        echo "請輸入有效成績 (0~100) 或 END 結束。"
    fi
done

# 若無輸入資料則結束
if [ ${#scores[@]} -eq 0 ]; then
    echo "尚未輸入任何成績，結束程式。"
    exit 1
fi

# 統計分析
pass=0
fail=0
total=${#scores[@]}

echo -e "\n【所有學生成績】"
for ((i=0; i<total; i++)); do
    echo "學生 $((i+1)) 成績：${scores[i]}"
    if [ ${scores[i]} -ge 60 ]; then
        ((pass++))
    else
        ((fail++))
    fi
done

# 計算比例（使用 bc 浮點運算）
pass_percent=$(echo "scale=2; $pass*100/$total" | bc)
fail_percent=$(echo "scale=2; $fail*100/$total" | bc)

# 結果輸出
echo "--------------------------"
echo "合格人數：$pass，合格率：$pass_percent%"
echo "不合格人數：$fail，不合格率：$fail_percent%"
echo "總人數：$total"
exit 0
