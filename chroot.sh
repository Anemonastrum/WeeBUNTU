#! /usr/bin/env bash

#Variable
NAMADISTRO="WeeBUNTU"

sleep 1
printf "\n \n Preparing Chroot Environment Started.... \n \n"
sudo mount -o bind /run/ edit/run
sudo cp /etc/hosts edit/etc/
sudo mount --bind /dev/ edit/dev
sudo chroot edit 'mount -t proc none /proc && mount -t sysfs none /sys mount -t devpts none /dev/pts'
