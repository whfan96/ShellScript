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

for ((i=1;i<=$varLine;i++))
do
	for ((space=1;space<=$varLine-$i;space++))
	do
		echo -n " "
	done
	
	for ((star=1;star<=$i;star++))
	do
		echo -n "*"
	done
	echo 
done

exit 0
