#!/bin/sh

# This script backs up the Nova3D touchscreen partitions
# You need to root it with adb, and have an SD card plugged
# in to use this

# Put the backup in a unique-ish directory (named after PID)
dirname=/mnt/extsd/system-images.$$
mkdir $dirname

# Uboot - unknown format
echo "#################################################"
echo "Backing up SPI flash partition 0 (uboot)"
dd if=/dev/block/mtdblock0 of=$dirname/mtdblock0-uboot.img

# Is this /?  Also unknown format
echo "#################################################"
echo "Backing up SPI flash partition 1 (boot)"
dd if=/dev/block/mtdblock1 of=$dirname/mtdblock1-boot.img

# This is a jffs2 filesystem, gets mounted at /data, and is 512KB
echo "#################################################"
echo "Backing up SPI flash partition 2 (/data)"
dd if=/dev/block/mtdblock2 of=$dirname/mtdblock2-data.img

# This stores the boot logo which you can configure by placing 
# a file called boot_logo.jpg in the root of the SD card and booting up.
# The code for that and other upgrade processes lives in /system/res/internal
echo "#################################################"
echo "Backing up SPI flash partition 3 (boot_logo)"
dd if=/dev/block/mtdblock3 of=$dirname/mtdblock3-boot_logo.img

# This s a 10MB squashfs filesystem that stores our UI of interest.
echo "#################################################"
echo "Backing up SPI flash partition 4 (/res [our UI])"
dd if=/dev/block/mtdblock4 of=$dirname/mtdblock4-res.img

echo "#################################################"
echo "System backed up to $dirname"
echo "#################################################"
