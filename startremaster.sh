#! /usr/bin/env bash

#WORKFOLDER
ANEBACK="Background"
ANECONF="Configuration"
ANEFONT="Fonts"
ANETHEME="GTK Theme"
ANEICONS="Icons & Cursor"
ANEPLY="Plymouth"
ANEUBI="Ubiquity"
ANESOU="Sounds"

#PATH
THEMES="/usr/share/themes"
ICONS="/usr/share/icons"

#COLOR
BLUE="Yaru-blue"
BARK="Yaru-bark"
MAGNETA="Yaru-magneta"
OLIVE="Yaru-olive"
PURR="Yaru-purssiangreen"
PURPLE="Yaru-purple"
RED="Yaru-red"
SAGE="Yaru-sage"
VIRI="Yaru-viridian"


codename=$(cat /etc/os-release | grep UBUNTU_CODENAME | cut -d = -f 2)
osname=$(cat /etc/os-release | grep '="Ubuntu"' | cut -d = -f 2)

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

printf "\n \n Starting to remaster ISO \n \n"
sleep 1
read -p 'Distro Name: ' DISNAME
sleep 1
printf "\n Preparing Resources"
sudo apt update -y
sudo apt install sassc libxml2-utils libglib2.0-dev-bin imagemagick dialog -y
sleep 1
clear
anemonabanner
printf "\n Removing trash apps \n"
sudo apt remove gnome-shell-extension-ubuntu-dock -y
sudo apt update -y
sudo apt install plank -y
sleep 1
clear
anemonabanner
printf "\n Configuring Themes \n"
sudo tar -xf "$ANETHEME"/WhiteSur-Light.tar.xz -C "$THEMES"/
sudo mv "$THEMES"/WhiteSur-Light "$THEMES"/Anemonize
sudo cp -r "$THEMES"/Anemonize/* "$THEMES"/Yaru/
sudo cp -r "$THEMES"/Anemonize/gnome-shell/* /usr/share/gnome-shell/theme/Yaru/
sleep 1
sudo tar -xf "$ANETHEME"/WhiteSur-Dark.tar.xz -C "$THEMES"/
sudo mv "$THEMES"/WhiteSur-Dark "$THEMES"/Anemonize-dark
sudo cp -r "$THEMES"/Anemonize-dark/* "$THEMES"/Yaru-dark/
sudo cp -r "$THEMES"/Anemonize/gnome-shell/* /usr/share/gnome-shell/theme/Yaru-dark/
sleep 1

sudo cp -r "$ANETHEME"/gnome-shell/* /usr/share/gnome-shell/theme/Yaru/
sudo cp -r "$ANETHEME"/gnome-shell/* /usr/share/gnome-shell/theme/Yaru-dark/

sudo cp -r "$ANETHEME"/extensions/modes/* /usr/share/gnome-shell/modes/
sudo cp -r "$ANETHEME"/extensions/ext/* /usr/share/gnome-shell/extensions/

printf "\n Patching Theme Accents \n"

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$BARK"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$BARK"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$BARK"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$BLUE"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$BLUE"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$BLUE"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$MAGNETA"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$MAGNETA"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$MAGNETA"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$OLIVE"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$OLIVE"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$OLIVE"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$PURR"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$PURR"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$PURR"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$RED"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$RED"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$RED"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$SAGE"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$SAGE"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$SAGE"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$PURPLE"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$PURPLE"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$PURPLE"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$VIRI"/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$VIRI"/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$VIRI"/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$BARK"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$BARK"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$BARK"-dark/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$BLUE"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$BLUE"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$BLUE"-dark/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$MAGNETA"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$MAGNETA"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$MAGNETA"-dark/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$OLIVE"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$OLIVE"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$OLIVE"-dark/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$PURR"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$PURR"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$PURR"-dark/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$RED"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$RED"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$RED"-dark/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$SAGE"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$SAGE"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$SAGE"-dark/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$PURPLE"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$PURPLE"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$PURPLE"-dark/

sudo cp -r "$THEMES"/Anemonize/gtk-2.0 "$THEMES"/"$VIRI"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-3.0 "$THEMES"/"$VIRI"-dark/
sudo cp -r "$THEMES"/Anemonize/gtk-4.0 "$THEMES"/"$VIRI"-dark/

printf "\n Configuring Icons \n"
sudo tar -xf "$ANEICONS"/Marwaita.tar.xz -C "$ICONS"/
sudo cp -r "$ICONS"/Marwaita/* "$ICONS"/Yaru/
sudo tar -xf "$ANEICONS"/Reversal.tar.xz -C "$ICONS"/
sudo cp -r "$ICONS"/Reversal-pink/* "$ICONS"/Yaru/
sudo cp -r "$ICONS"/Reversal-pink-dark/* "$ICONS"/Yaru-dark/
sleep 1
printf "\n Configuring Cursor \n"
sudo cp -r "$ANEICONS"/cursors/* "$ICONS"/Yaru/cursors/
sudo cp -r "$ANEICONS"/cursor.theme "$ICONS"/Yaru/
sudo cp -r "$ANEICONS"/cursors/* "$ICONS"/Yaru-dark/cursors/
sudo cp -r "$ANEICONS"/cursor.theme "$ICONS"/Yaru-dark/
sleep 1
printf "\n Configuring Ubiquity Insaller \n"
sudo cp -r "$ANEUBI"/ubiquity-slideshow/* /usr/share/ubiquity-slideshow/
printf "\n Configuring Background \n"
sudo cp -r "$ANEBACK"/* /usr/share/backgrounds/
sleep 1
printf "\n Configuring Fonts \n"
sudo cp -r "$ANEFONT"/* /usr/share/fonts/truetype/ubuntu/
sleep 1
printf "\n Configuring Sounds \n"
sudo cp -r "$ANESOU"/* /usr/share/sounds/Yaru/stereo/
sleep 1
printf "\n Configuring Bootanimation \n"
sudo cp -r "$ANEPLY"/* /usr/share/plymouth/
sleep 1
printf "\n Configuring Addtional Configuration \n"
sleep 1
printf "\n Activating Skel \n"
sudo cp -r "$ANECONF"/etc/default/useradd /etc/default/
sleep 1
printf "\n Disabling Wayland & Activating X11 \n"
sudo cp -r "$ANECONF"/etc/gdm3/* /etc/gdm3/
sleep 1
printf "\n Changing default themes and icons \n"
sudo cp -r "$ANECONF"/etc/gtk-3.0/* /etc/gtk-3.0/
sleep 1
printf "\n \n Adding '$DISNAME' Scripts \n \n"
sudo cp -r "$ANECONF"/etc/profile.d/* /etc/profile.d/
chmod +x /etc/profile.d/weebuntu.sh
sleep 1
sudo cp -r "$ANECONF"/etc/lsb-release /etc/
printf "\n Adding Skel configuration  \n"
sudo mkdir /etc/skel/.config
sudo mkdir /etc/skel/.local
sudo mkdir /etc/skel/Desktop
sudo cp -r "$ANECONF"/skel/dotconfig/* /etc/skel/.config/
sudo cp -r "$ANECONF"/skel/dotlocal/* /etc/skel/.local/
sudo cp -r "$ANECONF"/skel/Desktop/* /etc/skel/Desktop/
sleep 1
printf "\n Adding usr configuration  \n"
sudo cp -r "$ANECONF"/usr/lib/os-release /usr/lib/
sleep 1
printf "\n Adding MORE '$DISNAME' configuration \n"
sudo cp -r "$ANECONF"/usr/share/anemona /usr/share/
sudo cp -r "$ANECONF"/usr/share/icons/Yaru/* /usr/share/icons/Yaru/
sudo cp -r "$ANECONF"/usr/share/icons/Yaru/* /usr/share/icons/Reversal-pink/
sudo cp -r "$ANECONF"/usr/share/icons/Yaru/* /usr/share/icons/Reversal-pink-dark/
sudo cp -r "$ANECONF"/usr/share/gnome-background-properties/* /usr/share/gnome-background-properties/
sudo cp -r "$ANECONF"/usr/share/pixmaps/* /usr/share/pixmaps/
sudo cp -r "$ANECONF"/usr/share/plank /usr/share/
sudo cp -r "$ANECONF"/usr/share/ubuntu/* /usr/share/ubuntu/
sleep 1
sudo apt install xdotool -y
sudo apt install vlc -y
sudo apt install python3 -y
sudo apt install ubuntu-restricted-extras -y
sudo apt install gnome-shell-extensions -y

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://dl.discordapp.net/apps/linux/0.0.24/discord-0.0.24.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i discord-0.0.24.deb



printf "\n \n Done  \n \n"