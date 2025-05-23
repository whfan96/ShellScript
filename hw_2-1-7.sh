#!/bin/bash
# Author: Mia
# Version: v1.00

echo "請設定密碼："
read -s -p "請輸入密碼：" pass1
echo
read -s -p "請再次輸入密碼：" pass2
echo

if [ "$pass1" = "$pass2" ]; then
    echo "密碼設定完成！"
else
    echo "密碼無法設定：兩次輸入不一致。"
fi
