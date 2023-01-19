#! /usr/bin/env bash

#Variable
ANEGTK="GTK Theme"
ANEFONTS="Fonts"
ANECONF="Configuration"
ANEICNS="Icons & Cursor"
ANEWALL="Background"
ANEPLY="Plymouth"
ANEUBI="Ubiquity"


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
printf "\n \n Insallation Started...."
sleep 1
printf "\n \n Preparing Resources"
printf "\n \n Installing Packages"
clear
sudo apt update -y
sudo apt install sassc libxml2-utils libawadita libglib2.0-dev-bin imagemagick dialog 
sleep 1
clear
anemonabanner
