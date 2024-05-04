#!/bin/bash
disk=0
sd=0
ret=0

echo "Which crypted disk do you want to umount? "
echo "1) FOLIHARD"
echo "2) FALIHARD"
echo -n "-> "
read value

case $value in
	1)
		disk="FOLIHARD"
		sd="sdb"
		;;
	2)
		disk="FALIHARD"
		sd="sdc"
		;;
	*)
		echo "Invalid value"
		exit
		;;
esac

# su -c "killall -s 9 fatrace"

umount /media/$disk
cryptsetup close /dev/mapper/$disk
