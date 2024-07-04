#!/bin/bash
current_setting="$(ps -e | grep evtest | tr -s " " | cut -d' ' -f5 | tail -n 1)"
if [ "$current_setting" = "evtest" ]; then
	killall -s 9 evtest &
	echo -e "Touchpad is now enabled..\007";

else
	evtest --grab /dev/input/event9 > /dev/null 2>&1 &
	echo -e "Touchpad is now disabled..\007";
fi
