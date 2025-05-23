#!/bin/bash
# Description: Score calculator with customizable subject count.
# Author: Mia Fan
# Version: v1.20 - Add subject count input

# 詢問科目數量（最低 1）
read -p "Please enter the number of subjects (minimum 1): " subjectCount

# 檢查輸入是否合法
if ! [[ "$subjectCount" =~ ^[0-9]+$ ]] || (( subjectCount < 1 )); then
    echo "Invalid input. Please enter a number greater than 0."
    exit 1
fi

# 初始化總分為 0（index 0 為總分）
varScore[0]=0

# 讀取每科成績
for ((i=1; i<=subjectCount; i++)); do
    read -p "Enter score for Subject $i: " varScore[$i]

    # 加總分數
    let varScore[0]=${varScore[0]}+${varScore[$i]}
done

# 輸出結果
echo "Total score: ${varScore[0]}"
echo "Average score: $((${varScore[0]} / subjectCount))"

exit 0

