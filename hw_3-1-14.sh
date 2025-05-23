#!/bin/bash
# Author: Mia
# Version: v1.00

# 英文字母轉數字 (A=10, B=11, ..., Z=33)
get_letter_code() {
    local letter=$1
    local letters="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local index=$(expr index "$letters" "$letter")
    if [[ $index -eq 0 ]]; then
        return 1  # 無效字母
    fi
    local code=$((index + 9))  # A=10, B=11, ..., Z=33
    echo $code
    return 0
}

# 驗證身分證號格式與檢查碼
verify_id() {
    local id=$1

    # 檢查長度
    if [[ ! $id =~ ^[A-Z][12][0-9]{8}$ ]]; then
        echo "格式錯誤，請輸入合法的身分證號"
        return 1
    fi

    # 英文轉換
    local first_char=${id:0:1}
    local first_code=$(get_letter_code $first_char)
    if [[ $? -ne 0 ]]; then
        echo "英文代碼不合法"
        return 1
    fi

    # 拆解英文字母對應的兩位數
    local n1=$((first_code / 10))
    local n2=$((first_code % 10))

    # 取得剩下的數字
    local nums=()
    nums+=($n1 $n2)
    for ((i=1; i<10; i++)); do
        nums+=(${id:$i:1})
    done

    # 權重加總計算
    local weights=(1 9 8 7 6 5 4 3 2 1 1)
    local sum=0
    for i in "${!weights[@]}"; do
        sum=$((sum + nums[i] * weights[i]))
    done

    if ((sum % 10 == 0)); then
        echo "身分證號合法"
        return 0
    else
        echo "檢查碼錯誤"
        return 1
    fi
}

# 主程式
read -p "請輸入身分證字號：" input_id
verify_id "$input_id"
exit $?
