#!/bin/bash
# Write by Mia
# Version: v1.00

set -o nounset  # 或者 set -u

echo "Test2"

# 使用未初始化的變數
echo $undefined_variable  # 這會造成錯誤並終止腳本
