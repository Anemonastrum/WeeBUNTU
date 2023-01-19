#! /usr/bin/env bash

#Variable
ANEBACK="Background"
ANECONF="Configuration"
ANEFONT="Font"
ANETHEME="GTK Theme"
ANEICONS="Icons & Cursor"
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
printf "\n \n Memulai remastering ISO"
sleep 1
printf "\n \n Preparing Resources"
sudo apt update -y
sudo apt install sassc libxml2-utils libawadita libglib2.0-dev-bin imagemagick dialog
sleep 1
clear
anemonabanner
printf "\n \n Configuring Themes \n \n"
sudo tar -xf "$ANETHEME"/WhiteSur-Light.tar.xz -C /usr/share/themes/
sudo cp -r /usr/share/themes/WhiteSur-Light/* /usr/share/themes/Yaru/
sudo cp -r /usr/share/themes/WhiteSur-Light/gnome-shell/* /usr/share/gnome-shell/theme/Yaru/
sleep 1
printf "\n \n Configuring Icons \n \n"
sudo tar -xf "$ANEICONS"/Marwaita.tar.xz -C /usr/share/icons/
sudo cp -r /usr/share/icons/Marwaita/* /usr/share/icon/Yaru/
sleep 1
printf "\n \n Configuring Cursor \n \n"
sudo cp -r "$ANEICONS"/cursor /usr/share/icons/Yaru/
sudo cp -r "$ANEICONS"/cursor.theme /usr/share/icons/Yaru/
sleep 1
printf "\n \n Configuring Background \n \n"
sudo cp -r "$ANEBACK"/* /usr/share/backgrounds/
sleep 1
printf "\n \n Configuring Fonts \n \n"
sudo cp -r "$ANEFONT"/* /usr/share/fonts/truetype/ubuntu/
sleep 1
printf "\n \n Configuring Bootanimations \n \n"
sudo cp -r "$ANEPLY"/* /usr/share/plymouth/
sleep 1
printf "\n \n Configuring Addtional Configuration \n \n"
sleep 1
printf "\n \n Activating Skel \n \n"
sudo cp -r "$ANECONF"/etc/default/useradd /etc/default/
sleep 1
printf "\n \n Disabling Wayland & Activating X11 \n \n"
sudo cp -r "$ANECONF"/etc/gdm3/* /etc/gdm3/
sleep 1
printf "\n \n Changing default themes and icons \n \n"
sudo cp -r "$ANECONF"/etc/gtk-3.0/* /etc/gtk-3.0/
sleep 1
printf "\n \n Adding WeeBUNTU Scripts \n \n"
sudo cp -r "$ANECONF"/etc/profiles.d/* /etc/profiles.d/
sleep 1
sudo cp -r "$ANECONF"/etc/lsb-release /etc/
printf "\n \n Adding Skel configuration \n \n"
sudo mkdir /etc/skel/.config
sudo mkdir /etc/skel/.local
sudo cp -r "$ANECONF"/skel/dotconfig/* /etc/skel/.config/
sudo cp -r "$ANECONF"/skel/dotlocal/* /etc/skel/.local/
sleep 1
printf "\n \n Adding usr configuration  \n \n"
sudo cp -r "$ANECONF"/usr/lib/os-release /usr/lib/
sleep 1
printf "\n \n Adding WeeBUNTU configuration  \n \n"
sudo cp -r "$ANECONF"/usr/share/anemona /usr/share/
sudo cp -r "$ANECONF"/usr/share/icons/* /usr/share/icons/
sudo cp -r "$ANECONF"/usr/share/gnome-background-properties/* /usr/share/gnome-background-properties/
sudo cp -r "$ANECONF"/usr/share/pixmaps/* /usr/share/pixmaps/
sudo cp -r "$ANECONF"/usr/share/plank /usr/share/
sudo cp -r "$ANECONF"/usr/share/ubuntu/ /usr/share/ubuntu/
sleep 1
printf "\n \n Done  \n \n"