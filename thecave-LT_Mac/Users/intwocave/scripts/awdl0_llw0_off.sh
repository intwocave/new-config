# !/bin/bash
while [ true ]
do
    ifconfig awdl0 down
    ifconfig llw0 down
    sleep 2
done
