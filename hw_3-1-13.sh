#!/bin/bash
# Description: 發票對獎程式
# Author: Mia Fan
# Version: 1.1 修正末碼比對邏輯

# 中獎號碼 (可依期別更換)
special_prize="AB12345678"       # 特別獎
grand_prize="CD87654321"         # 特獎
first_prizes=("EF11111111" "GH22222222" "IJ33333333")  # 頭獎
sixth_prizes=("444" "555" "666") # 增開六獎：末三碼

# 對獎判斷函數：傳入號碼，回傳中獎等級
check_prize() {
    local num=$1

    # 特別獎
    if [[ "$num" == "$special_prize" ]]; then
        return 1
    fi

    # 特獎
    if [[ "$num" == "$grand_prize" ]]; then
        return 2
    fi

    # 頭獎及以下獎項
    for prize in "${first_prizes[@]}"; do
        # 8位數完全比對
        if [[ "${num:2:8}" == "${prize:2:8}" ]]; then
            return 3
        fi

        # 7位末碼比對（二獎）
        if [[ "${num:3:7}" == "${prize:3:7}" ]]; then
            return 4
        fi

        # 6位末碼比對（三獎）
        if [[ "${num:4:6}" == "${prize:4:6}" ]]; then
            return 5
        fi

        # 5位末碼比對（四獎）
        if [[ "${num:5:5}" == "${prize:5:5}" ]]; then
            return 6
        fi

        # 4位末碼比對（五獎）
        if [[ "${num:6:4}" == "${prize:6:4}" ]]; then
            return 7
        fi

        # 3位末碼比對（六獎）
        if [[ "${num:7:3}" == "${prize:7:3}" ]]; then
            return 8
        fi
    done

    # 增開六獎判斷：末三碼比對
    for s6 in "${sixth_prizes[@]}"; do
        if [[ "${num:7:3}" == "$s6" ]]; then
            return 9
        fi
    done

    return 0  # 未中獎
}

# 主流程
until false; do
    read -p "請輸入發票號碼 (10 碼，或 END 結束): " input
    [[ "$input" == "END" ]] && echo "感謝使用，再會！" && break

    # 格式檢查
    if ! [[ "$input" =~ ^[A-Z]{2}[0-9]{8}$ ]]; then
        echo "[錯誤] 格式錯誤，請輸入如 AB12345678"
        continue
    fi

    check_prize "$input"
    result=$?

    case $result in
        1) echo "🎉 恭喜中『特別獎』1000萬！" ;;
        2) echo "🎉 恭喜中『特獎』200萬！" ;;
        3) echo "🎉 恭喜中『頭獎』20萬！" ;;
        4) echo "🎉 恭喜中『二獎』4萬！" ;;
        5) echo "🎉 恭喜中『三獎』1萬！" ;;
        6) echo "🎉 恭喜中『四獎』4千！" ;;
        7) echo "🎉 恭喜中『五獎』1千！" ;;
        8) echo "🎉 恭喜中『六獎』200元！" ;;
        9) echo "🎉 恭喜中『增開六獎』200元！" ;;
        0) echo "😢 很可惜，未中獎。" ;;
    esac
done

exit 0

