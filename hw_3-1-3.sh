#!/bin/bash
# Author: Mia
# Version: v1.00
# 使用 while 迴圈累加輸入的數字，直到輸入 END 或非數字停止

sum=0
count=0

echo "請輸入數字進行累加，輸入 END 或非數字停止："

while true; do
  read -p "輸入數字或 END 結束: " input

  # 判斷是否輸入 END
  if [[ "$input" == "END" ]]; then
    break
  fi

  # 判斷是否為數字 (整數或浮點數)
  if [[ "$input" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
    sum=$(echo "$sum + $input" | bc)
    count=$((count + 1))
  else
    # 非數字且非 END，結束輸入
    break
  fi
done

echo "累加總和：$sum"

if (( count > 0 )); then
  avg=$(echo "scale=2; $sum / $count" | bc)
  echo "平均數：$avg"
else
  echo "無有效數字輸入，無法計算平均數"
fi

exit 0
