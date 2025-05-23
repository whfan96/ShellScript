#!/bin/bash
# Author: Mia
# Version: v1.00

echo "請在 5 秒內輸入你的名字："
read -t 5 name
if [ -z "$name" ]; then
  echo "時間到，沒有輸入任何資料！"
else
  echo "你好，$name！"
fi