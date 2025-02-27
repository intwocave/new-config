#!/bin/bash
disk=0
uu_foli=d2b2bfff-52b4-4484-83df-544da8b0ae30
uu_fali=f6fa0f9c-66ee-40bf-8b3d-daa2084dd2bf
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

sudo cryptsetup open /dev/$sd $disk
sudo mkdir -p /media/$disk
sudo mount /dev/mapper/$disk /media/$disk

# su -c "cd /media/${disk}; rm /home/intwocave/ramdisk/${disk}_access.log; fatrace -c -t -o /home/intwocave/ramdisk/${disk}_access.log &"
