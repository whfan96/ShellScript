#!/bin/bash
# Author: Mia
# Version: v1.00

# 宣告關聯式陣列
declare -A countries

# 賦值
countries["TW"]="Taiwan"
countries["JP"]="Japan"
countries["US"]="United States"
countries["FR"]="France"

# 使用者輸入查詢
read -p "Enter a country code (e.g., TW): " code

# 查詢顯示
if [[ -n "${countries[$code]}" ]]; then
    echo "The country is: ${countries[$code]}"
else
    echo "Country code not found."
fi
