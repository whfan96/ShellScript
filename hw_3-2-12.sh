#!/bin/bash
# Description: Get phone number from external phonebook.
# Write by: 350 & Mia
# Version: v2.00

PHONEBOOK_FILE="./phonebook.txt"

# 檢查資料庫是否存在
if [ ! -f "$PHONEBOOK_FILE" ]; then
    echo "[ERROR] Phonebook file not found: $PHONEBOOK_FILE"
    exit 1
fi

# 讀取查詢參數
read -p "[PHONEBOOK] Enter Name to Search: " queryName

echo "選擇查詢模式："
echo "1) 完整比對"
echo "2) 模糊比對"
read -p "請輸入查詢模式 (1 or 2)： " mode

echo -e "\n[RESULT] 查詢結果如下："

case $mode in
    1)
        result=$(grep -iw "^$queryName" "$PHONEBOOK_FILE")
        ;;
    2)
        result=$(grep -i "$queryName" "$PHONEBOOK_FILE")
        ;;
    *)
        echo "[ERROR] 無效的查詢模式，請輸入 1 或 2"
        exit 2
        ;;
esac

# 判斷是否有結果
if [ -z "$result" ]; then
    echo "[NOTICE] 查無資料，請確認輸入是否正確。"
else
    echo "$result" | cut -d " " -f 2
fi

exit 0

