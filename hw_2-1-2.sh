#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "請輸入一條指令: " user_cmd

# 判斷是否有輸入內容
if [ -n "$user_cmd" ]; then
    echo "$user_cmd" >> commRecoder.txt           # 累加記錄指令
    eval "$user_cmd" 2>/dev/null                  # 執行指令，忽略錯誤
else
    echo "未輸入任何指令。"
fi
