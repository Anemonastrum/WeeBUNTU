#! /usr/bin/env bash

#Variable
ANEBACK="Background"
ANECONF="Configuration"
ANEFONT="Font"
ANETHEME="GTK Theme"
ANEICONS="Icons & Cursor"
ANEPLY="Plymouth"
ANEUBI="Ubiquity"

codename=$(cat /etc/os-release | grep UBUNTU_CODENAME | cut -d = -f 2)
osname=$(cat /etc/os-release | grep '="Ubuntu"' | cut -d = -f 2)

ANEAPT="sudo apt install"
ANESNP="sudo snap install"
KOPI="sudo cp -r"

THEMEDIR="/usr/share/themes"
ICONDIR="/usr/share/icons"

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
printf "\n \n Checking Environment"

if [ "$codename" == "focal" ]  || [ "$codename" == "hirsute" ] && [ "$osname" == '"Ubuntu"' ]; then
  PKGM="apt"

elif [ "$codename" == "impish" ] || [ "$codename" == "jammy" ] || [ "$codename" == "kinetic" ] && [ "$osname" == '"Ubuntu"' ]; then
  PKGM="apt"

else
  echo -e "
------------------------------------------------------------------
Sorry, This Script is only for Ubuntu Distro
------------------------------------------------------------------
"
  exit 1
fi

printf "\n \n Starting to remaster ISO"
sleep 1
read -p 'Distro Name: ' DISNAME
printf "\n \n Preparing Resources"
sudo apt update -y
"$ANEAPT" sassc libxml2-utils libawadita libglib2.0-dev-bin imagemagick dialog -y
sleep 1
clear
anemonabanner
printf "\n \n Removing trash apps \n \n"
sudo apt remove gnome-shell-extension-ubuntu-dock
sudo apt update -y
"$ANEAPT" plank
sleep 1
clear
anemonabanner
printf "\n \n Configuring Themes \n \n"
sudo tar -xf "$ANETHEME"/WhiteSur-Light.tar.xz -C "$THEMEDIR"/
sudo mv "$THEMEDIR"/WhiteSur-Light "$THEMEDIR"/Anemonize
"$KOPI" "$THEMEDIR"/Anemonize/* "$THEMEDIR"/Yaru/
"$KOPI" "$THEMEDIR"/Anemonize/gnome-shell/* /usr/share/gnome-shell/theme/Yaru/
sleep 1
sudo tar -xf "$ANETHEME"/WhiteSur-Dark.tar.xz -C "$THEMEDIR"/
sudo mv "$THEMEDIR"/WhiteSur-Dark "$THEMEDIR"/Anemonize-dark
"$KOPI" "$THEMEDIR"/Anemonize-dark/* "$THEMEDIR"/Yaru-dark/
"$KOPI" "$THEMEDIR"/Anemonize/gnome-shell/* /usr/share/gnome-shell/theme/Yaru-dark/
sleep 1
printf "\n \n Configuring Icons \n \n"
sudo tar -xf "$ANEICONS"/Marwaita.tar.xz -C "$ICONDIR"/
"$KOPI" "$ICONDIR"/Marwaita/* /usr/share/icon/Yaru/
sleep 1
printf "\n \n Configuring Cursor \n \n"
"$KOPI" "$ANEICONS"/cursor "$ICONDIR"/Yaru/
"$KOPI" "$ANEICONS"/cursor.theme "$ICONDIR"/Yaru/
sleep 1
printf "\n \n Configuring Background \n \n"
"$KOPI" "$ANEBACK"/* /usr/share/backgrounds/
sleep 1
printf "\n \n Configuring Fonts \n \n"
"$KOPI" "$ANEFONT"/* /usr/share/fonts/truetype/ubuntu/
sleep 1
printf "\n \n Configuring Bootanimations \n \n"
"$KOPI" "$ANEPLY"/* /usr/share/plymouth/
sleep 1
printf "\n \n Configuring Addtional Configuration \n \n"
sleep 1
printf "\n \n Activating Skel \n \n"
"$KOPI" "$ANECONF"/etc/default/useradd /etc/default/
sleep 1
printf "\n \n Disabling Wayland & Activating X11 \n \n"
"$KOPI" "$ANECONF"/etc/gdm3/* /etc/gdm3/
sleep 1
printf "\n \n Changing default themes and icons \n \n"
"$KOPI" "$ANECONF"/etc/gtk-3.0/* /etc/gtk-3.0/
sleep 1
printf "\n \n Adding WeeBUNTU Scripts \n \n"
"$KOPI" "$ANECONF"/etc/profiles.d/* /etc/profiles.d/
sleep 1
"$KOPI" "$ANECONF"/etc/lsb-release /etc/
printf "\n \n Adding Skel configuration \n \n"
sudo mkdir /etc/skel/.config
sudo mkdir /etc/skel/.local
"$KOPI" "$ANECONF"/skel/dotconfig/* /etc/skel/.config/
"$KOPI" "$ANECONF"/skel/dotlocal/* /etc/skel/.local/
sleep 1
printf "\n \n Adding usr configuration  \n \n"
"$KOPI" "$ANECONF"/usr/lib/os-release /usr/lib/
sleep 1
printf "\n \n Adding '$DISNAME' configuration  \n \n"
"$KOPI" "$ANECONF"/usr/share/anemona /usr/share/
"$KOPI" "$ANECONF""$ICONDIR"/* "$ICONDIR"/
"$KOPI" "$ANECONF"/usr/share/gnome-background-properties/* /usr/share/gnome-background-properties/
"$KOPI" "$ANECONF"/usr/share/pixmaps/* /usr/share/pixmaps/
"$KOPI" "$ANECONF"/usr/share/plank /usr/share/
"$KOPI" "$ANECONF"/usr/share/ubuntu/ /usr/share/ubuntu/
sleep 1
printf "\n \n Adding '$DISNAME' Apps  \n \n"
"$ANESNP" spotify
"$ANESNP" discord
"$ANEAPT" vlc
"$ANEAPT" python3
"$ANEAPT" ubuntu-restricted-extras


printf "\n \n Done  \n \n"
