#! /usr/bin/env bash

#Variable
ANEGTK="GTK Theme"
ANECUR="Cursors"
ANEEXT="GNOME Theme"
ANEFONTS="Fonts"
ANECONF="Configuration"
ANEICNS="Icons"


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
sudo apt update -y
sudo apt install gnome-tweaks
sleep 1
printf "\n \n Installing GTK Themes"
./"$ANEGTK/install.sh" -n AnemonizeTheme -t all -c Light -o normal -i ubuntu -m --round
sleep 1
printf "\n \n Installing Icons"
./"$ANEICNS"/install.sh -n AnemonizeICONS
sleep 1
printf "\n \n Installing Fonts"
cp "$ANEFONTS"/* ~/.local/share/Fonts
sleep 1
printf "\n \n Installing Cursors"
./"$ANECUR"/install.sh
mkdir ~/.icons
cp ~/.local/share/icons/Vimic-cursors ~/.icons
sleep 1
printf "\n \n Installing GNOME Extensions"
cp "$ANEEXT"/* ~/.local/share/gnome-shell/extensions
sleep 1
printf "\n \n Applying Configurations"
dconf load "$ANECONF"/
sleep 1
