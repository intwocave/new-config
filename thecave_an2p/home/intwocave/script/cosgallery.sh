#!/bin/bash
disk="CosGallery"
uu_cos=6A73-57BF
sd=$(ls -l /dev/disk/by-uuid | grep $uu_cos | awk '{print $NF}' | sed 's#.*/##')
mount -o uid=1000,gid=1000 /dev/$sd /mnt/$disk
