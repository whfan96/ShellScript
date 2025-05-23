#!/bin/bash
# Author: Mia
# Version: v1.00

i=1
while [ $i -le 9 ]; do
  for j in $(seq 1 $i); do
    printf "%d×%d=%2d " $j $i $((i * j))
  done
  echo
  ((i++))
done
exit 0