#!/bin/bash
# Write by Mia
# Version: v1.00

set -o errexit  # 或者 set -e
echo "Test 1"
ls /nonexistentdir  # 假設這行命令會失敗

# 以下的命令不會被執行，因為上一個命令失敗，腳本已經終止
echo "123"
