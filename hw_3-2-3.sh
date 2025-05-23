#!/bin/bash
# Author: Mia
# Version: v1.00
# 密碼產生器
# 可指定產生數字與英文，並設定長度

read -p "請輸入密碼長度: " length

# 讓使用者選擇是否包含數字與英文
read -p "是否包含數字? (y/n): " include_num
read -p "是否包含英文? (y/n): " include_alpha

# 建立字元集
chars=""

if [[ "$include_num" =~ ^[Yy]$ ]]; then
    chars+="0123456789"
fi

if [[ "$include_alpha" =~ ^[Yy]$ ]]; then
    chars+="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
fi

# 檢查字元集是否為空
if [ -z "$chars" ]; then
    echo "錯誤：字元集為空，請至少選擇包含數字或英文。"
    exit 1
fi

# 產生密碼
password=""
for ((i=0; i<length; i++)); do
    index=$(( RANDOM % ${#chars} ))
    password+=${chars:$index:1}
done

echo "產生的密碼為: $password"

