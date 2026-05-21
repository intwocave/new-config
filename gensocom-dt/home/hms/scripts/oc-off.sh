#!/bin/sh

# Source: https://github.com/LulaSvob/overclock-nvidia-ubuntu-linux/blob/main/oc.sh

# README
# Before proceeding make sure that you set your coolbits to 31
# Open a terminal and do
# $ sudo nvidia-xconfig -a --cool-bits=31 --allow-empty-initial-configuration

# To be able to set the power limit you need to enable sudo commands without password
# Do 
# $ sudo visudo
# And then at the end of the file add the following while changing username to your user
# Note the tabs after username as otherwise it won't work
# username        ALL = (ALL) NOPASSWD: /usr/bin/nvidia-persistenced
# username        ALL = (ALL) NOPASSWD: /usr/bin/nvidia-smi
# Reboot the system now and continue setting the OC limits 

# =========================== Define OC limts ===========================================
# Fans speed is in %
POWER_LIMIT=220
# FANS_SPEED=80
GPU_OFFSET=0 # Up to 170, recommended 150.
# Memory offset has to be the actual desired amount.
MEMORY_OFFSET=0 # Up to 1500, recommended 1500.

# ========================================================================================
# It is advisable not to change anything below this line if you don't know what you are doing

SET='env DISPLAY=:0 /usr/bin/nvidia-settings'

#Set Power Limit
sudo nvidia-smi -pl $POWER_LIMIT
sudo nvidia-smi -pm 0

# Set power persistence mode to ON so your power limit setting can persist even no UI app is running
${SET} -a "[gpu:0]/GpuPowerMizerMode=0"

# Set fan target level
${SET} -a "[gpu:0]/GPUFanControlState=0"

${SET} -a "[fan:0]/GPUTargetFanSpeed=$FANS_SPEED"
${SET} -a "[fan:1]/GPUTargetFanSpeed=$FANS_SPEED"

# Set clocks speeds
${SET} -a "[gpu:0]/GPUGraphicsClockOffsetAllPerformanceLevels=$GPU_OFFSET"

ACTUAL_MEMORY_OFFSET=$(( MEMORY_OFFSET*2  ))
${SET} -a "[gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=$ACTUAL_MEMORY_OFFSET"

#Send notification
notify-send "OC Done: Fans = $FANS_SPEED% | GPU=$GPU_OFFSET | Memory=$MEMORY_OFFSET" -t 4000 -i messagebox_info

