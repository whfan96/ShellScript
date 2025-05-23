#!/bin/bash
# Write by Mia
# Version: v1.00

set -o noclobber
echo hello > list-a.txt   # 若 list-a.txt 存在會出錯
