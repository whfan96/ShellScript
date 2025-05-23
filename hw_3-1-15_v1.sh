#!/bin/bash
# Author: Mia
# Version: v1.00

PS3="請選擇你的飲料："

select drink in Coffee Tea Juice Exit
do
    case $drink in
        Coffee) echo "你選擇了咖啡";;
        Tea)    echo "你選擇了茶";;
        Juice)  echo "你選擇了果汁";;
        Exit)   echo "感謝使用！"; break;;
        *)      echo "請輸入有效編號 (1~4)";;
    esac
done
exit 0
