#!/bin/bash
# Description: Menu list using while with case
# Author: 350 & Mia
# Version: v1.10 - 改進使用者體驗與程式結構

while true
do
    clear
    echo "=========================="
    echo "     (1) Say Hello"
    echo "     (2) Show Time"
    echo "     (3) Exit"
    echo "=========================="

    read -n 1 -p "Please choose the function (1~3): " choice
    echo ""

    case "$choice" in
        1)
            echo -e "\nHello!\n"
            ;;
        2)
            echo -e "\nTime is: $(date)\n"
            ;;
        3)
            echo -e "\nExiting program. Bye!\n"
            break
            ;;
        *)
            echo -e "\n[Error] Invalid selection: '$choice'. Please choose 1 ~ 3.\n"
            ;;
    esac

    read -n 1 -s -p "Press any key to continue..."
done

exit 0
