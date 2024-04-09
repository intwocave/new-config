#!/bin/bash
#watch -n1 vcgencmd measure_temp
watch -n1 "sensors|grep -i temp"
