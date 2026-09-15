#!/bin/bash
echo "Backup Cosplay photos to CosGallery.."
echo "1) Dry-run"
echo "2) Real"
echo -n "-> "
read value

COMMON_OPTS=('--modify-window=1' '--exclude=._*' '--exclude=.fseventsd' '--exclude=.Spotlight-V100' '--exclude=.Trashes' '--exclude=.DS_Store' '--exclude=*~' '--delete' '--delete-excluded' '--iconv=utf-8-mac,utf-8')

case $value in
	1)
		rsync -avhWPn "${COMMON_OPTS[@]}" ~/Downloads/EOSR6M2/ 192.168.0.100:"/mnt/CosGallery/EOSR6M2/"
		rsync -avhWPn "${COMMON_OPTS[@]}" ~/Downloads/done 192.168.0.100:"/mnt/CosGallery/"
		rsync -avhWPn "${COMMON_OPTS[@]}" "/Volumes/Clow - Data/Users/monakio/Downloads/코스프레촬영" 192.168.0.100:"/mnt/CosGallery/"
		rsync -avhWPn "${COMMON_OPTS[@]}" "/Volumes/Clow - Data/Users/monakio/Pictures/Lightroom Projects" 192.168.0.100:"/mnt/CosGallery/"
		;;
	2)
		rsync -avhWP "${COMMON_OPTS[@]}" ~/Downloads/EOSR6M2/ 192.168.0.100:"/mnt/CosGallery/EOSR6M2/"
		rsync -avhWP "${COMMON_OPTS[@]}" ~/Downloads/done 192.168.0.100:"/mnt/CosGallery/"
		rsync -avhWP "${COMMON_OPTS[@]}" "/Volumes/Clow - Data/Users/monakio/Downloads/코스프레촬영" 192.168.0.100:"/mnt/CosGallery/"
		rsync -avhWP "${COMMON_OPTS[@]}" "/Volumes/Clow - Data/Users/monakio/Pictures/Lightroom Projects" 192.168.0.100:"/mnt/CosGallery/"
		;;
	*)
		echo "Invalid value"
		exit
		;;
esac
