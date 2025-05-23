#!/bin/bash
# Author: Mia
# Version: v1.00

echo "請輸入你的名字（預設為 John）："
read name
name=${name:-John}  
echo "你好，$name！"