#!/bin/bash
# Description: Fast change network configure (support wireless)
# Write by 350 & Mia
# Version: v3.00 - Add wireless support and interface validation

[ $USER != "root" ] && echo "You are not root, exit!" && exit 99

# Default interface
defInterface="ens33"  # 可預設為有線或 wlan0

# Default network profile
defSelect=0
varSelect=

# Profile definitions
setLocal[0]="Home"
setInterface[0]="wlan0"
setIP[0]="192.168.34.222/24"
setGateway[0]="192.168.34.2"
setDNS[0]="1.1.1.1"

setLocal[1]="Tibame"
setInterface[1]="ens33"
setIP[1]="10.120.3.50/16"
setGateway[1]="10.120.0.254"
setDNS[1]="8.8.8.8"

setLocal[2]="TaiGG"
setInterface[2]="ens33"
setIP[2]="172.16.21.18/24"
setGateway[2]="172.16.21.1"
setDNS[2]="172.16.0.53"

setLocal[3]="Office"
setInterface[3]="wlan0"
setIP[3]="192.168.100.34/24"
setGateway[3]="192.168.100.1"
setDNS[3]="168.95.1.1"

# Function to set network
function funSetNetwork {
    local iface=${setInterface[$varSelect]}
    ip link set "$iface" up                     # 確保介面啟用
    ip address flush dev "$iface" &>/dev/null   # 清空原設定
    ip address add ${setIP[$varSelect]} dev "$iface"
    ip route add default via ${setGateway[$varSelect]} dev "$iface"
    echo "nameserver ${setDNS[$varSelect]}" > /etc/resolv.conf
}

# Show Menu
echo "======= FAST CHANGE NETWORK ======="
for (( i=0; i<${#setLocal[@]}; i++ )); do
    echo "  ($i) ${setLocal[$i]} [${setInterface[$i]}] - ${setIP[$i]}"
done
echo "==================================="

# User select
read -t 10 -p "Please Select (def: $defSelect): " varSelect
varSelect=${varSelect:-$defSelect}

# Check interface exists
if ! ip link show "${setInterface[$varSelect]}" &>/dev/null; then
    echo "[ERROR] Network interface '${setInterface[$varSelect]}' not found!"
    exit 1
fi

# Apply network
funSetNetwork

echo -e "\n✔ Successfully set [${setLocal[$varSelect]}] network on interface [${setInterface[$varSelect]}]\n"
exit 0
