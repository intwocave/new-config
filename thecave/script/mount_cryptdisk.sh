#!/bin/bash
disk=0
sd=0
ret=0

echo "Which crypted disk do you want to mount? "
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

sudo cryptsetup open /dev/$sd $disk
sudo mount /dev/mapper/$disk /media/$disk

# su -c "cd /media/${disk}; rm /home/intwocave/ramdisk/${disk}_access.log; fatrace -c -t -o /home/intwocave/ramdisk/${disk}_access.log &"
