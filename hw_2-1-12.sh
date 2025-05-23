#!/bin/bash
# Author: Mia
# Version: v1.00

defaultLine=8

read -p "Please input the Line numbers (default is $defaultLine): " inputLine

if [[ -z "$inputLine" ]]
then
	varLine=$defaultLine
elif [[ "$inputLine" =~ ^[0-9]+$ ]]
then
	varLine=$inputLine
else
	echo "Error: You must input a positive integer."
	exit 1
fi

for ((i="$varLine";i>0;i--))
do
	for ((j=1;j<=i;j++))
	do
		echo -n "*";
	done
	echo 
done

exit 0