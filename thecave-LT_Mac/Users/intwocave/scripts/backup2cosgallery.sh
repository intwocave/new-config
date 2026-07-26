#!/bin/bash
echo "Backup Cosplay photos to CosGallery.."
echo "1) Dry-run"
echo "2) Real"
echo -n "-> "
read value

case $value in
	1)
		rsync -avhWPn --exclude="._*" --exclude=".DS_Store" --exclude="*~" --delete ~/Downloads/EOSR6M2/ "/Volumes/CosGallery/EOSR6M2/"
		rsync -avhWPn --exclude="._*" --exclude=".DS_Store" --exclude="*~" --delete ~/Downloads/done "/Volumes/CosGallery/"
		rsync -avhWPn --exclude="._*" --exclude=".DS_Store" --exclude="*~" --delete "/Volumes/Clow - Data/Users/monakio/Downloads/코스프레촬영" "/Volumes/CosGallery/"
		;;
	2)
		rsync -avhWP --exclude="._*" --exclude=".DS_Store" --exclude="*~" --delete ~/Downloads/EOSR6M2/ "/Volumes/CosGallery/EOSR6M2/"
		rsync -avhWP --exclude="._*" --exclude=".DS_Store" --exclude="*~" --delete ~/Downloads/done "/Volumes/CosGallery/"
		rsync -avhWP --exclude="._*" --exclude=".DS_Store" --exclude="*~" --delete "/Volumes/Clow - Data/Users/monakio/Downloads/코스프레촬영" "/Volumes/CosGallery/"
		;;
	*)
		echo "Invalid value"
		exit
		;;
esac
