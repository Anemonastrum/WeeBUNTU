#! /usr/bin/env bash

#Variable
NAMADISTRO="WeeBUNTU"

anemonabanner()
{
  printf "     _    _   _ _____ __  __  ___  _   _    _    
    / \  | \ | | ____|  \/  |/ _ \| \ | |  / \   
   / _ \ |  \| |  _| | |\/| | | | |  \| | / _ \  
  / ___ \| |\  | |___| |  | | |_| | |\  |/ ___ \ 
 /_/   \_\_| \_|_____|_|  |_|\___/|_| \_/_/   \_\ "
}

progress()
{
    barr=''
    for (( y=50; y <= 100; y++ )); do
        sleep 0.05
        barr="${barr} "
 
        echo -ne "\r"
        echo -ne "\e[43m$barr\e[0m"
 
        local left="$(( 100 - $y ))"
        printf " %${left}s"
        echo -n "${y}%"
    done
    echo -e "\n"
}

anemonabanner
sleep 1
printf "\n \n Remastering Started.... \n \n"
sleep 1
read -p 'ISO NAME: ' NAMAISO
sudo apt-get update
sleep 1
sudo apt-get install apparmor apparmor-utils bridge-utils libvirt-clients libvirt-daemon-system libguestfs-tools qemu-kvm virt-manager
sleep 1
sudo apt-get install binwalk casper genisoimage live-boot live-boot-initramfs-tools squashfs-tools
sudo apt-get dist-upgrade
sudo apt-get autoremove
sudo apt-get clean
sleep 1
printf "\n \n Setting up work folder...."
sudo mkdir isomount
sudo mount -o loop "$NAMAISO" isomount
sudo mkdir extracted
sleep 1
printf "\n \n Syncing '$NAMAISO'"
sudo rsync --exclude=/casper/filesystem.squashfs -a isomount/ extracted
sleep 1
printf "\n \n Extracting '$NAMAISO' to work folder"
sudo unsquashfs isomount/casper/filesystem.squashfs
sudo mv squashfs-root edit
sleep 1
printf "\n \n Unpack Completed..."
