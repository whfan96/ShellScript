#!/bin/bash
# Author: Mia
# Version: v1.00

# Bash 中的 BASH_VERSINFO 是一個陣列
echo "${BASH_VERSINFO[@]}"

for i in "${!BASH_VERSINFO[@]}"; do
  echo "Index $i: ${BASH_VERSINFO[$i]}"
done

