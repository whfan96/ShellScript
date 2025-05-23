#!/bin/bash
# Author: Mia
# Version: v1.00

gender=$1
tw_size=$2

# 根據性別決定對應邏輯
case "$gender" in
  M)
    jp_size=$tw_size
    cn_size=$(echo "$tw_size - 0.5" | bc)
    kr_size=$(echo "$tw_size * 10" | bc)
    ;;
  F)
    jp_size=$tw_size
    cn_size=$(echo "$tw_size - 1.0" | bc)
    kr_size=$(echo "$tw_size * 10" | bc)
    ;;
  *)
    echo "無效的性別輸入（請輸入 M 或 F）"
    exit 1
    ;;
esac

# 輸出結果
echo "============ 鞋碼對照表 ============"
echo "TW（台灣）: ${tw_size} cm"
echo "JP（日本）: ${jp_size} cm"
echo "CN（中國）: ${cn_size}"
echo "KR（韓國）: ${kr_size} mm"
echo "====================================="
exit 0
