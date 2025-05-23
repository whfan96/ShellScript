#!/bin/bash
# Author: Mia
# Version: v1.00

# 函式：計算平均數
# 傳入參數：總和、數量
function calculate_average() {
  local sum=$1
  local count=$2
  if (( count == 0 )); then
    echo "0"
  else
    echo "scale=2; $sum / $count" | bc
  fi
}

sum=0
count=0

until false; do
  read -p "Enter a number (or type END to finish): " input
  if [[ "$input" == "END" ]]; then
    break
  elif [[ "$input" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    sum=$(echo "$sum + $input" | bc)
    ((count++))
  else
    echo "Invalid input, please enter a number or END."
  fi
done

avg=$(calculate_average "$sum" "$count")
echo "Total numbers entered: $count"
echo "Sum: $sum"
echo "Average: $avg"

exit 0
