#!/bin/bash
# Author: Mia
# Version: v1.00

# 自訂模組環境設定範例
MODULE_PATHS=(/opt/moduleA /opt/moduleB /opt/moduleC)

# 匯出路徑
for path in "${MODULE_PATHS[@]}"; do
    export PATH="$path:$PATH"
	echo "add $path ok!!!"
done

echo "New: $PATH"
