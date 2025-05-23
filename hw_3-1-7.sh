#!/bin/bash
# Author: Mia
# Version: v1.00

# Function: calculator
# Params: operator num1 num2
calculator() {
    local op="$1"
    local num1="$2"
    local num2="$3"
    local result

    case "$op" in
        +) result=$(echo "$num1 + $num2" | bc) ;;
        -) result=$(echo "$num1 - $num2" | bc) ;;
        \*)
            result=$(echo "$num1 * $num2" | bc)
            ;;
        /)
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero"
                return 1
            else
                result=$(echo "scale=2; $num1 / $num2" | bc)
            fi
            ;;
        *)
            echo "Unsupported operator: $op"
            return 2
            ;;
    esac

    echo "$result"
}

# Main program
read -p "Enter operator (+, -, *, /): " operator
read -p "Enter first number: " first
read -p "Enter second number: " second

# Call calculator
calc_result=$(calculator "$operator" "$first" "$second")

# Check result only if success
if [[ $? -eq 0 ]]; then
    echo "Result: $calc_result"
fi

