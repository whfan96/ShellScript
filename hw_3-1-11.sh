#!/bin/bash
# Author: Mia
# Version: v1.00
# Description: Student record input program
# Save to file: StudentsList.txt

prev_class=""
prev_no=0

while true; do
    echo "==== New Student Input ===="

    # 班級輸入（預設用上一位學生的）
    read -p "Enter Class (press Enter to use [$prev_class]): " class
    if [[ -z "$class" ]]; then
        class="$prev_class"
    fi

    # 座號輸入（預設為上一位 +1）
    read -p "Enter Seat Number (press Enter to use [$((prev_no + 1))]): " no
    if [[ -z "$no" ]]; then
        no=$((prev_no + 1))
    fi

    # 強制輸入姓名
    while true; do
        read -p "Enter Name: " name
        [[ -n "$name" ]] && break
        echo "[Error] Name cannot be empty."
    done

    # 強制輸入性別（0或1）
    while true; do
        read -p "Enter Gender (0 for Female, 1 for Male): " gender
        if [[ "$gender" == "0" || "$gender" == "1" ]]; then
            break
        fi
        echo "[Error] Gender must be 0 or 1."
    done

    # 顯示確認資訊
    echo "[INFO] Class: $class | No: $no | Name: $name | Gender: $gender"

    # 輸出至檔案
    echo "$class,$no,$name,$gender" >> StudentsList.txt
    echo "[Saved] Student record added to StudentsList.txt."

    # 更新前一筆資料
    prev_class="$class"
    prev_no=$no

    # 是否繼續輸入？
    read -p "Add another student? (Y/N): " ans
    [[ "$ans" != [Yy] ]] && break
done

exit 0
