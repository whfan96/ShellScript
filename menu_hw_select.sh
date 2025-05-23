#!/bin/bash

HW_DIR="/root/mia/hw"

declare -A homeworks=(
  [1-1]="8 9 14 15 18"
  [1-2]="1 3 6 9 13"
  [2-1]="3 11 13 15 17"
  [2-2]="7 8 9 12 13"
  [3-1]="8 10 11 12 13"
  [3-2]="4 6 7 10 11"
)

function show_homeworks() {
  echo "目前有以下自選題目："
  for hw in "${!homeworks[@]}"; do
    echo "# $hw 作業：自選 5 題"
    for num in ${homeworks[$hw]}; do
      echo "### $hw-$num"
    done
    echo
  done
}

while true; do
  echo "------ 主選單 ------"
  echo "1) 顯示自選題目"
  echo "2) 查詢題號檔案"
  echo "3) 列出所有作業檔案"
  echo "4) 執行題號相關檔案"
  echo "5) 離開"
  read -p "請輸入選項 (1~5): " menu_choice

  case "$menu_choice" in
    1)
      echo
      show_homeworks
      ;;

    2)
      while true; do
        read -p "請輸入題號（例如 1-1-8），或直接按 Enter 結束查詢: " input_num
        if [ -z "$input_num" ]; then
          echo "結束查詢。"
          break
        fi

        mapfile -t files < <(find "$HW_DIR" -maxdepth 1 -type f -regextype posix-extended -regex ".*/hw_${input_num}([_.].*)?")

        if [ ${#files[@]} -eq 0 ]; then
          echo "找不到相關檔案"
        else
          ls -l "${files[@]}"
        fi
      done
      ;;

    3)
      echo "所有作業檔案清單："
      ls -l "$HW_DIR"/hw_*
      ;;

    4)
      read -p "請輸入題號（例如 1-1-8）執行相關檔案，或直接按 Enter 取消: " exec_num
      if [ -z "$exec_num" ]; then
        echo "取消執行。"
        continue
      fi

      mapfile -t exec_files < <(find "$HW_DIR" -maxdepth 1 -type f -regextype posix-extended -regex ".*/hw_${exec_num}([_.].*)?")

      if [ ${#exec_files[@]} -eq 0 ]; then
        echo "找不到相關檔案，無法執行。"
        continue
      fi

      for f in "${exec_files[@]}"; do
        echo "執行檔案：$f"
        if [ ! -x "$f" ]; then
          echo "沒有執行權限，嘗試加上..."
          chmod +x "$f"
        fi
        "$f"
        echo "----------"
      done
      ;;

    5)
      echo "離開程式，掰掰！"
      exit 0
      ;;

    *)
      echo "請輸入有效選項（1~5）"
      ;;
  esac
done

