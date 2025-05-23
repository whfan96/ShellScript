#!/bin/bash
# Author: Mia
# Version: v1.00

# 建立/指定通訊錄檔案
file="contacts.txt"
echo "=== Address Book ==="

# 初始化陣列
names=()
phones=()
emails=()

while true; do
    # 輸入姓名、電話、Email
    read -p "Enter Name (or type 'end' to quit): " name
    [[ "$name" == "end" ]] && break
    read -p "Enter Phone: " phone
    read -p "Enter Email: " email

    # 使用檢查替換提供預設值
    name=${name:-"Unknown"}
    phone=${phone:-"N/A"}
    email=${email:-"N/A"}

    # 存入陣列
    names+=("$name")
    phones+=("$phone")
    emails+=("$email")

    # 寫入檔案（附加）
    echo "Name: $name, Phone: $phone, Email: $email" >> "$file"
    echo "Record saved."
done

echo "=== Entry Completed ==="
exit 0
