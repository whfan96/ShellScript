#!/bin/bash
# Author: Mia
# Version: v1.00

for ((i=0;i<4;i++)); do
  for ((j=3;j>i;j--)); do echo -n "　"; done
  for ((k=0;k<2*i+1;k++)); do echo -n "＊"; done
  echo
  done
for ((i=2;i>=0;i--)); do
  for ((j=3;j>i;j--)); do echo -n "　"; done
  for ((k=0;k<2*i+1;k++)); do echo -n "＊"; done
  echo
  done
