#!/bin/bash
# Author: Mia
# Version: v1.00

sleep 3 &
sleep 5 &
echo "Waiting for background jobs..."
wait    # 等待所有背景工作完成
echo "All background jobs finished."

