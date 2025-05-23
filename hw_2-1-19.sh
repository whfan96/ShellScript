#!/bin/bash
# Author: Mia
# Version: v1.00

read -p "Enter number a: " a
read -p "Enter number b: " b

sum=$(echo "$a + $b" | bc)
div=$(echo "scale=2; $a / $b" | bc)

echo "Sum: $sum"
echo "Division (2 decimal): $div"
