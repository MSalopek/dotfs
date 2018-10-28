#!/bin/bash

# shell script to prepend i3status with kblayout info

i3status --config ~/.i3status.conf | while :
do
	read line
	LG=$(setxkbmap -query | awk '/layout/{print $2}')
	echo "LG: $LG | $lin || exit 1
done	
