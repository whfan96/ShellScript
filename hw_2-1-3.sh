#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "請輸入檔名或目錄 (可含路徑): " target

if [ -e "$target" ]; then
    echo "✔ [$target] 存在！"

    if [ -r "$target" ]; then
        echo "🔹 可讀取 (Read)"
    else
        echo "🔸 無讀取權限"
    fi

    if [ -w "$target" ]; then
        echo "🔹 可寫入 (Write)"
    else
        echo "🔸 無寫入權限"
    fi

    if [ -x "$target" ]; then
        echo "🔹 可執行 (Execute)"
    else
        echo "🔸 無執行權限"
    fi
else
    echo "❌ [$target] 不存在！"
fi
