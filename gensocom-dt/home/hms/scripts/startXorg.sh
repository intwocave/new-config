#!/bin/bash
sudo nohup Xorg :0 -config /etc/X11/xorg.conf > /dev/null 2>&1 &
