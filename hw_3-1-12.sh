#!/bin/bash
# Description: 發票紀錄程式，符合格式後寫入文字檔
# Author: Mia
# Version: v1.00

# 檢查發票號碼格式的函數
check_invoice() {
    local invoice=$1
    if [[ $invoice =~ ^[A-Z]{2}[0-9]{8}$ ]]; then
        return 0  # 格式正確
    else
        return 1  # 格式錯誤
    fi
}

# 輸入發票的迴圈
while true; do
    read -p "請輸入發票號碼 (輸入 END 結束): " invoice

    # 結束條件
    if [[ "$invoice" == "END" ]]; then
        echo "[INFO] 輸入結束。"
        break
    fi

    # 檢查格式
    if check_invoice "$invoice"; then
        echo "$invoice" >> InvoiceList.txt
        echo "[OK] 發票已儲存到 InvoiceList.txt"
    else
        echo "[ERROR] 格式錯誤！格式應為 2 個大寫英文字母 + 8 個數字 (例如: AB12345678)"
    fi
done

exit 0
