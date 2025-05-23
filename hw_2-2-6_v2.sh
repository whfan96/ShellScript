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

# 取出所有鍵
echo "取出所有鍵值: ${!countries[@]}"

# 取出所有值
echo "取出所有值: ${countries[@]}"

# 計算數量
echo "計算數量： ${#countries[@]}"
