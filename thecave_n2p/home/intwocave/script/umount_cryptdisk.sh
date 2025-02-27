#!/bin/bash
disk=0
uu_foli=d2b2bfff-52b4-4484-83df-544da8b0ae30
uu_fali=f6fa0f9c-66ee-40bf-8b3d-daa2084dd2bf
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
		sd=$(ls -l /dev/disk/by-uuid | grep $uu_foli | awk '{print $NF}' | sed 's#.*/##')
		;;
	2)
		disk="FALIHARD"
		sd=$(ls -l /dev/disk/by-uuid | grep $uu_fali | awk '{print $NF}' | sed 's#.*/##')
		;;
	*)
		echo "Invalid value"
		exit
		;;
esac

# su -c "killall -s 9 fatrace"

sudo umount /media/$disk
sudo cryptsetup close /dev/mapper/$disk
