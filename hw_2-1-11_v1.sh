#!/bin/bash
# Author: Mia
# Version: v1.00

for i in {1..9}; do
    for j in {1..9}; do
        printf "%d×%d=%2d\t" $i $j $((i * j))
    done
    echo
done