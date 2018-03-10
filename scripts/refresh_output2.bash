#!/bin/bash
cd "$(dirname $0)"

NUM_DISCONNECTED=$(xrandr | grep disconnected | wc -l)

if [ "$NUM_DISCONNECTED" -eq 1 ]
then
	xrandr --output VIRTUAL1 --off --output HDMI1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
	PRIMARY_OUTPUT=HDMI1
else
	xrandr --output HDMI1 --off --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
	PRIMARY_OUTPUT=eDP1
fi

./refresh_polybar.bash $PRIMARY_OUTPUT
