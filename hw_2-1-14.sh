#!/bin/bash
# Author: Mia
# Version: v1.00

for ((i=1; i<=8; i++)); do
    if [[ $i -eq 1 || $i -eq 8 ]]; then
        echo "　　　　＊＊＊＊＊＊＊＊"
    else
        echo "　　　　＊　　　　　　＊"
    fi
done

