#!/bin/bash
current_setting="$(gsettings get org.gnome.desktop.peripherals.touchpad send-events)"
if [ "$current_setting" = "'enabled'" ]; then
	gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
	gsettings get org.gnome.desktop.peripherals.touchpad send-events
	echo -e "Touchpad is now disabled..\007";

else
	gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
	gsettings get org.gnome.desktop.peripherals.touchpad send-events
	echo -e "Touchpad is now enabled..\007";
fi
