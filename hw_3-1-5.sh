#!/bin/bash
# Author: Mia
# Version: v1.00
# 輸入一數字，列印出 1,000 以內該數的倍數

read -p "Please enter a number: " num

# 確認輸入為正整數
if ! [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
  echo "Please enter a valid positive integer."
  exit 1
fi

multiple=1
until (( multiple * num > 1000 )); do
  echo $(( multiple * num ))
  (( multiple++ ))
done
exit 0
