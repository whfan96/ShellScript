#!/bin/bash
# Description: Decimal to Binary Converter using function
# Author: Mia Fan
# Version: v1.00

# Function: decimal_to_binary
decimal_to_binary() {
    local decimal=$1
    local binary=""

    # 如果輸入為 0
    if [[ $decimal -eq 0 ]]; then
        echo 0
        return
    fi

    while [[ $decimal -gt 0 ]]; do
        binary=$((decimal % 2))$binary
        decimal=$((decimal / 2))
    done

    echo "$binary"
}

# 主程式：輸入與驗證
read -p "Please enter a decimal number: " input

# 檢查是否為合法整數
if ! [[ "$input" =~ ^[0-9]+$ ]]; then
    echo "Invalid input: Must be a non-negative integer."
    exit 1
fi

# 呼叫 function 並輸出結果
binary_result=$(decimal_to_binary "$input")
echo "Binary of $input is: $binary_result"

exit 0
