#! /usr/bin/env bash

#Variable
ANEGTK="GTK Theme"
ANECUR="Cursors"
ANEEXT="GNOME Extensions"
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
sudo apt install gnome-tweaks gnome-shell
sleep 1
clear
printf "\n \n Installing GTK Themes"
./"$ANEGTK/install.sh" -n AnemonizeTheme -t blue -c Light -o normal -i ubuntu -m --round
sleep 1
printf "\n \n Installing Icons"
./"$ANEICNS"/install.sh -n AnemonizeICONS
sleep 1
printf "\n \n Installing Fonts"
cp -r "$ANEFONTS"/* ~/.local/share/Fonts/
sleep 1
printf "\n \n Installing Cursors"
./"$ANECUR"/install.sh
mkdir ~/.icons
cp -r ~/.local/share/icons/Cursors ~/.icons
cp -r ~/.local/share/icons/Vimix-cursors ~/.icons
sleep 1
printf "\n \n Installing GNOME Extensions"
mkdir ~/.local/share/gnome-shell/extensions
cp -r "$ANEEXT"/* ~/.local/share/gnome-shell/extensions
sleep 1
printf "\n \n Applying Configurations"
sleep 1
gnome-extensions enable arcmenu@arcmenu.com
gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable CoverflowAltTab@palatis.blogspot.com
gnome-extensions enable dash-to-panel@jderose9@github.com
gnome-extensions enable gsconnect@andyholmes.github.io
gnome-extensions enable mediacontrols@cliffniff.github.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable ding@rastersoft.com
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable ubuntu-dock@ubuntu.com
sleep 1
dconf load /org/gnome/shell/extensions/< "$ANEEXT"/all_extension_settings.conf
sleep 1
printf "\n \n Applying Addtional Configurations"
gsettings set org.gnome.desktop.interface gtk-theme AnemonizeTheme-Light-blue
gsettings set org.gnome.desktop.interface cursor-theme Vimix-cursors
gsettings set org.gnome.desktop.interface icon-theme AnemonizeICONS-light
gsettings set org.gnome.shell.extensions.user-theme name AnemonizeTheme-Light-blue
gsettings set org.gnome.desktop.sound theme-name freedesktop
gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/ubuntu_by_arman1992.jpg"
gsettings set org.gnome.desktop.screensaver "file:///usr/share/backgrounds/ubuntu_by_arman1992.jpg"
gsettings set org.gnome.desktop.interface font-name "Roboto 11"
gsettings set org.gnome.desktop.interface document-font-name "Roboto 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Roboto 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Roboto 11"
gsettings set org.gnome.desktop.wm.preferences button-layout "minimize,maximize,close"
sleep 1
sudo apt install conky-all curl jq moc -y
sleep 1
printf "\n \n Applying Desktop Configurations"
mkdir ~/.config/conky
mkdir ~/.config/autostart
cp -r "$ANECONF"/Graffias ~/.config/conky/
cp -r "$ANECONF"/start_conky.desktop ~/.config/autostart/
sleep 1
./"$ANEGTK"/tweaks.sh -s
./"$ANEGTK"/tweaks.sh -f monterey
sleep 1
printf "\n \n Done"