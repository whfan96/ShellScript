#!/bin/bash
# Description: 網路主機監控程式
# Author: Mia
# Version: v1.00

LOGFILE="host_monitor.log"

# 讀取主機列表 (可用空白分隔或一行一個)
echo "請輸入欲監控的主機清單（IP或網域名），空白分隔："
read -a hosts

if [ ${#hosts[@]} -eq 0 ]; then
    echo "未輸入任何主機，程式結束。"
    exit 1
fi

echo "開始監控以下主機："
for h in "${hosts[@]}"; do
    echo "  - $h"
done

echo "監控中... 按 Ctrl+C 結束"

# 記錄主機狀態：1為正常，0為無回應
declare -A status

while true; do
    for host in "${hosts[@]}"; do
        ping -c 1 -W 1 "$host" &> /dev/null
        if [ $? -eq 0 ]; then
            # 主機正常
            if [ "${status[$host]}" != "1" ]; then
                echo "$(date '+%Y-%m-%d %H:%M:%S') INFO: 主機 $host 恢復正常。" | tee -a "$LOGFILE"
                status[$host]=1
            fi
        else
            # 主機無回應
            if [ "${status[$host]}" != "0" ]; then
                echo -e "\a"   # 發出系統聲響
                echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR: 主機 $host 無回應！" | tee -a "$LOGFILE"
                status[$host]=0
            fi
        fi
    done
    sleep 10  # 每 10 秒檢查一次，可視需要調整
done
