#!/bin/bash
sudo DISPLAY=:0 nvidia-settings -a "[gpu:0]/GPUFanControlState=1"
sudo DISPLAY=:0 nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=$1"
