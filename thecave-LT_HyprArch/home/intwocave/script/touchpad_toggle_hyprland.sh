#!/bin/bash
current_setting="$(ps -e | grep evtest | tr -s " " | cut -d' ' -f5 | tail -n 1)"
if [ "$current_setting" = "evtest" ]; then
	killall -s 9 evtest &
	echo -e "Touchpad is now enabled..";

else
	evtest --grab `libinput list-devices | grep Touchpad -A 1 | tail -n1 | tr -s " " | cut -d' ' -f2` > /dev/null 2>&1 &
	echo -e "Touchpad is now disabled..";
fi
