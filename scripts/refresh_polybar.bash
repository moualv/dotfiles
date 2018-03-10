#!/bin/bash
POLYBAR_CONFIG_FILE=~/dotfiles/polybar/config

CONNECTED_SCREENS=$(xrandr --query | grep -E 'connected.*[0-9]{1,4}x[0-9]{1,4}' | awk '{print $1}')

TRAY_MONITOR=$1

LAPTOP_MONITOR_NAMES=eDP

killall polybar

for SCREEN in $CONNECTED_SCREENS
do
	CONFIG_FILE=$(mktemp)
	cat $POLYBAR_CONFIG_FILE > $CONFIG_FILE
	echo '[bar/moucho]' >> $CONFIG_FILE
	if [[ $SCREEN =~ .*eDP.* ]]
	then
		echo "inherit = bar/laptop" >> $CONFIG_FILE
	else
		echo "inherit = bar/monitor" >> $CONFIG_FILE
	fi

	if [[ $SCREEN == $TRAY_MONITOR || ! $TRAY_MONITOR ]]
	then
		echo "tray-position = right" >> $CONFIG_FILE
	fi
	polybar -c $CONFIG_FILE moucho &
done

