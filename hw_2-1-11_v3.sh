#!/bin/bash
# Author: Mia
# Version: v1.00

for ((block=1; block<=3; block++)); do
    start=$(( (block - 1) * 3 + 1 ))
    end=$(( start + 2 ))

    for ((i=1; i<=9; i++)); do
        for ((j=start; j<=end; j++)); do
            printf "%d×%d=%-4d" $j $i $((j * i))
        done
        echo
    done
    echo
done