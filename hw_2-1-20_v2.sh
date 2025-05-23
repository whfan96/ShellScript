#!/bin/bash
# Author: Mia
# Version: v1.00

sleep 3 &
pid1=$!
sleep 5 &
pid2=$!

echo "Waiting for sleep 3 to finish..."
wait $pid1      # 只等待 sleep 3 完成
echo "sleep 3 done."

echo "Waiting for sleep 5 to finish..."
wait $pid2
echo "sleep 5 done."
