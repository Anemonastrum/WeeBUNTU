#! /usr/bin/env bash

#Variable
ANEGTK="GTK Theme"
ANECUR="Cursors"
ANEEXT="GNOME Extensions"
ANEFONTS="Fonts"
ANECONF="Configuration"
ANEICNS="Icons"
ANEWALL="Wallpapers"
ANEADD="Addtional"


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
sudo apt install gnome-tweaks gnome-shell gnome-shell-extensions -y
sleep 1
clear
anemonabanner
printf "\n \n Installing GTK Themes"
#./"$ANEGTK/install.sh" -n AnemonizeTheme -t blue -c Light -o normal -i ubuntu -m --round -s 260
sudo cp -r "$ANEGTK"/source/* /usr/share/gnome-shell/theme/
sleep 1
printf "\n \n Installing Icons"
#./"$ANEICNS"/install.sh -n AnemonizeICONS
sudo cp -r "$ANEICNS"/sourcce/* /usr/share/icons/
sleep 1
printf "\n \n Installing Fonts"
#mkdir ~/.local/share/fonts/
#cp -r "$ANEFONTS"/* ~/.local/share/fonts/
sudo cp -r "$ANEFONTS"/* /usr/local/share/fonts/
sleep 1
printf "\n \n Installing Cursors"
#cp -r ./"$ANECUR"/AnemonizeCur ~/.local/share/icons/
#cp -r ~/.local/share/icons/AnemonizeCur ~/.icons
sudo cp -r ./"$ANECUR"/AnemonizeCur /usr/share/icons/
sleep 1
printf "\n \n Installing GNOME Extensions"
#mkdir ~/.local/share/gnome-shell/extensions
#cp -r "$ANEEXT"/* ~/.local/share/gnome-shell/extensions
sudo cp -r "$ANEEXT"/* /usr/share/gnome-shell/extensions/
sleep 1
printf "\n \n Applying Configurations"
sudo systemctl restart gdm
sleep 1
gnome-extensions enable arcmenu@arcmenu.com
gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable CoverflowAltTab@palatis.blogspot.com
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable gsconnect@andyholmes.github.io
gnome-extensions enable mediacontrols@cliffniff.github.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable ding@rastersoft.com
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable ubuntu-dock@ubuntu.com
sleep 1
dconf load /org/gnome/shell/extensions/< "$ANECONF"/all_extension_settings.conf
sleep 1
printf "\n \n Applying Addtional Configurations"
gsettings set org.gnome.desktop.interface gtk-theme AnemonizeTheme-Light-blue
gsettings set org.gnome.desktop.interface cursor-theme AnemonizeCur
gsettings set org.gnome.desktop.interface icon-theme AnemonizeICONS
gsettings set org.gnome.shell.extensions.user-theme name AnemonizeTheme-Light-blue
gsettings set org.gnome.desktop.sound theme-name freedesktop
gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/canvas_by_roytanck.jpg"
gsettings set org.gnome.desktop.screensaver "file:///usr/share/backgrounds/canvas_by_roytanck.jpg"
gsettings set org.gnome.desktop.interface font-name "Roboto 11"
gsettings set org.gnome.desktop.interface document-font-name "Roboto 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Roboto 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Roboto 11"
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize"
sleep 1
sudo apt install conky-all curl jq moc -y
sleep 1
printf "\n \n Applying Desktop Configurations"
#mkdir ~/.config/conky
#mkdir ~/.config/autostart
#cp -r "$ANECONF"/Graffias ~/.config/conky/
#cp -r "$ANECONF"/start_conky.desktop ~/.config/autostart/
sudo mkdir /etc/skel
sudo cp "$ANEADD"/* /etc/skel/
sleep 1
#sudo ./"$ANEGTK"/tweaks.sh -s
sleep 1
#sudo ./"$ANEGTK"/tweaks.sh -f monterey
sleep 1
printf "\n \n Done"
reboot