#!/bin/bash
# 3-2-9 多組鬧鐘常駐程式
# Author: Mia
# Version: v1.0

declare -A alarms  # 關聯式陣列儲存鬧鐘（時間 => 訊息）

# 允許使用者新增鬧鐘
add_alarm() {
    while true; do
        read -p "請輸入鬧鐘時間（HH:MM，輸入 q 結束設定）： " time
        [[ "$time" == "q" ]] && break

        if [[ ! "$time" =~ ^([01]?[0-9]|2[0-3]):[0-5][0-9]$ ]]; then
            echo "❌ 時間格式錯誤，請使用 HH:MM（24 小時制）"
            continue
        fi

        read -p "請輸入提示訊息： " msg
        alarms["$time"]="$msg"
        echo "✅ 鬧鐘已設定：$time → $msg"
    done
}

# 顯示目前設定的鬧鐘
show_alarms() {
    echo "==== 目前設定的鬧鐘 ===="
    for time in "${!alarms[@]}"; do
        echo "🕒 $time → ${alarms[$time]}"
    done
}

# 主程式
echo "🔔 多組鬧鐘設定程式"
add_alarm
show_alarms
echo "⏰ 鬧鐘開始執行中...（按 Ctrl+C 結束）"

# 常駐輪詢，每 60 秒檢查一次
while true; do
    now=$(date +%H:%M)

    for time in "${!alarms[@]}"; do
        if [[ "$now" == "$time" ]]; then
            echo -e "\n🔔 鬧鐘響了！時間：$time"
            echo "💡 提示：${alarms[$time]}"
            echo -e '\a'  # 發出 beep 聲（終端支援的話）
            # 可加上系統聲音播放（視作業系統支援）：
            # paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga 2>/dev/null &
        fi
    done
    sleep 60  # 每分鐘檢查一次
done
