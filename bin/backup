#!/bin/bash

echo "Unlocking the Backup drive"
doas cryptsetup luksOpen /dev/sdb1 backup

echo "Mounting the Backup drive to /mnt/backup"
doas mount /dev/mapper/backup /mnt/

cd /

echo "Backing up"
doas rsync -aAXv --delete --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/","swapfile","lost+found",".cache",".VirtualBoxVMs",".ecryptfs"} \
    / /mnt/

if [ $? -eq 0 ]; then
    echo "Backup completed successfully" && notify-send -t 5000 "RSync" "Completed successfully"
else
    echo "Some error occurred during backup" && notify-send -u critical "RSync" "Errors occurred during backup."
fi

echo "Unmounting Backup drive"
doas umount /mnt/backup/

echo "Closing Backup drive"
doas cryptsetup luksClose backup

echo "It is now safe to remove the drive."
