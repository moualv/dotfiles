#!/bin/bash

PRIORITIES="HDMI1 eDP1"
EXTENDS=$1

for prio in $PRIORITIES
do
	if mons | tail -2 | awk '{print $2}' | grep -q $prio
	then
		PRIMARY_OUTPUT=$prio
		break;
	fi
	break
done

mons --primary $PRIMARY_OUTPUT
mons -e $EXTENDS

bash refresh_polybar.bash $PRIMARY_OUTPUT
