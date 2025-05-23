#!/bin/bash
# Author: Mia
# Version: v1.00

for ((i=1;i<=8;i++)); do
  for ((j=1;j<=8;j++)); do
    if [ $i -eq 1 ] || [ $i -eq 8 ] || [ $j -eq 1 ] || [ $j -eq 8 ]; then
      echo -n "＊"
    else
      echo -n "　"
    fi
  done
  echo
  done
