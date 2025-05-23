#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "請輸入一個檔案或目錄名稱（可含路徑）：" target

if [ -e "$target" ]; then
    echo "項目存在：$target"

    # 檢查讀取權限
    if [ -r "$target" ]; then
        echo "你有 [讀取] 權限 (r)"
    else
        echo "你【沒有】[讀取] 權限 (r)"
    fi

    # 檢查寫入權限
    if [ -w "$target" ]; then
        echo "你有 [寫入] 權限 (w)"
    else
        echo "你【沒有】[寫入] 權限 (w)"
    fi

    # 檢查執行權限
    if [ -x "$target" ]; then
        echo "你有 [執行] 權限 (x)"
    else
        echo "你【沒有】[執行] 權限 (x)"
    fi

else
    echo "錯誤：該檔案或目錄不存在。"
fi
