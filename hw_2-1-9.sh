#!/bin/bash
# Author: Mia
# Version: v1.00

echo "==== 面積計算程式 ===="
echo "請選擇圖形類型："
echo "1) 四角形"
echo "2) 圓形"
echo "3) 正三角形"
read -p "請輸入選項 (1~3): " choice

case "$choice" in
1)
    read -p "請輸入長: " length
    read -p "請輸入寬: " width
    if [ "$length" -gt 0 ] && [ "$width" -gt 0 ]; then
        let area=length*width
        echo "四角形面積為: $area"
    else
        echo "輸入錯誤，長與寬需為正整數"
    fi
    ;;
2)
    read -p "請輸入半徑: " radius
    if [ "$radius" -gt 0 ]; then
        let area=314*radius*radius/100   # 3.14 × r²，使用整數近似
        echo "圓形面積約為: $area"
    else
        echo "半徑必須為正整數"
    fi
    ;;
3)
    read -p "請輸入邊長: " side
    if [ "$side" -gt 0 ]; then
        let area=1732*side*side/4000    # (√3/4 ≈ 0.433) ⇒ 1.732/4 = 0.433
        echo "正三角形面積約為: $area"
    else
        echo "邊長必須為正整數"
    fi
    ;;
*)
    echo "輸入錯誤，請輸入 1~3 的選項。"
    ;;
esac
exit 0