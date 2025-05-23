#!/bin/bash
# Author: Mia
# Version: v1.00

# 設定留言檔案名稱
GUESTBOOK="guestbook.txt"

# 提示使用者輸入
echo "=== 歡迎使用留言板 ==="
read -p "請輸入您的名字： " name
read -p "請輸入您的留言： " message

# 檢查留言是否為空
if [[ -z "$message" ]]; then
    echo "留言不可為空！"
    exit 1
fi

# 將留言寫入檔案，格式為：時間 - 名字：留言內容
echo "$(date '+%Y-%m-%d %H:%M:%S') - $name：$message" >> "$GUESTBOOK"

# 檢查是否寫入成功
if [[ $? -eq 0 ]]; then
    echo "[成功] 您的留言已儲存。"
else
    echo "[失敗] 儲存留言失敗！"
    exit 2
fi

# 顯示目前所有留言
echo -e "\n=== 目前留言內容 ==="
cat "$GUESTBOOK"
exit 0