#!/bin/bash
# Author: Mia
# Version: v1.00

# 使用者輸入目錄
read -p "請輸入目錄路徑：" dir

# 檢查是否為存在的目錄
if [ ! -d "$dir" ]; then
    echo "錯誤：$dir 不是有效的目錄！"
    exit 1
fi

# 進入該目錄，避免路徑問題
cd "$dir" || exit 1

# 使用 for 逐一判斷
echo "位於 $dir 的項目分類如下："
for item in *; do
    if [ -f "$item" ]; then
        echo "[檔案] $item"
    elif [ -d "$item" ]; then
        echo "[目錄] $item"
    fi
done
exit 0