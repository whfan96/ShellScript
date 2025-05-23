#!/bin/bash
# Description: IP + Netmask 檢查與網段計算程式
# Author: Mia Fan
# Version: v1.00

# 檢查 IP 或 Netmask 格式是否合法（IPv4）
check_ip_valid() {
    local ip=$1
    local valid_regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

    if ! [[ "$ip" =~ $valid_regex ]]; then
        echo "Invalid format: $ip"
        return 1
    fi

    IFS='.' read -r a b c d <<< "$ip"
    for n in $a $b $c $d; do
        if (( n < 0 || n > 255 )); then
            echo "Invalid octet in: $ip"
            return 1
        fi
    done
    return 0
}

# 計算 Network Address
calculate_network() {
    local ip=$1
    local netmask=$2

    IFS='.' read -r ip1 ip2 ip3 ip4 <<< "$ip"
    IFS='.' read -r nm1 nm2 nm3 nm4 <<< "$netmask"

    # 執行 AND 運算以取得網段
    net1=$((ip1 & nm1))
    net2=$((ip2 & nm2))
    net3=$((ip3 & nm3))
    net4=$((ip4 & nm4))

    echo "Network Address: $net1.$net2.$net3.$net4"
}

# ===== 主程式區 =====
read -p "Enter IP Address: " ipaddr
read -p "Enter Netmask: " netmask

# 驗證 IP 與 Netmask
check_ip_valid "$ipaddr" || exit 1
check_ip_valid "$netmask" || exit 1

# 計算網段
calculate_network "$ipaddr" "$netmask"

exit 0
