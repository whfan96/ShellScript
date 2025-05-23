#!/bin/bash
# Description: Use the loop (while) to simulate "nl" command.
# Author: Mia Fan
# Version: v1.20 - Check file existence and readability separately

read -p "Please enter File-Name: " varFileName

# 先確認是否為一般檔案
if [ ! -f "$varFileName" ]; then
    echo "Error: '$varFileName' is not a regular file."
    exit 1
fi

# 再確認是否可讀
if [ ! -r "$varFileName" ]; then
    echo "Error: File '$varFileName' is not readable."
    exit 1
fi

noLine=1

while read txtLine
do
    echo -e "\t$noLine $txtLine"
    let noLine=noLine+1
done < "$varFileName"

exit 0
