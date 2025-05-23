#!/bin/bash
# Author: Mia
# Version: v1.00
# 密碼驗證程式，密碼只能錯三次

correct_password="secret123"
attempt=0
max_attempts=3

until [[ $attempt -ge $max_attempts ]]; do
  read -s -p "Enter password: " input_password
  echo
  if [[ "$input_password" == "$correct_password" ]]; then
    echo "Password correct. Access granted."
    exit 0
  else
    ((attempt++))
    echo "Incorrect password. Attempt $attempt of $max_attempts."
  fi
done

echo "Too many failed attempts. Access denied."
exit 1
