#!/bin/bash
# Author: Mia
# Version: v1.00

while true; do
  echo "1) Date"
  echo "2) Uptime"
  echo "3) Exit"
  read -p "Choose: " opt
  case $opt in
    1) date;;
    2) uptime;;
    3) break;;
    *) echo "Invalid";;
  esac
done# Author: Mia
# Version: v1.00