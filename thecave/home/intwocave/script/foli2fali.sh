#!/bin/bash
echo "Backup FOLIHARD to FALIHARD.."
echo "1) Dry-run"
echo "2) Real"
echo -n "-> "
read value

case $value in
	1)
		rsync -avzhPn --delete /media/FOLIHARD/ /media/FALIHARD/
		;;
	2)
		rsync -avzhP --delete /media/FOLIHARD/ /media/FALIHARD/
		;;
	*)
		echo "Invalid value"
		exit
		;;
esac
