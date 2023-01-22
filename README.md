## Linux Base 
- Ubuntu 22.04.1 Jammy [Link](http://releases.ubuntu.com/jammy/)

<img src=https://github.com/Anemonastrum/RemasterUbuntu/raw/main/Background/warty-final-ubuntu.png width="auto" height="auto"/>

## Sources
- GTK Theme [Source](https://github.com/vinceliuice/WhiteSur-gtk-theme)
- Icons Theme [Source](https://github.com/yeyushengfan258/Reversal-icon-theme)
- Cursors [Source](https://github.com/vinceliuice/Vimix-cursors)

## Features to Add
- New System Theme
- New Icon Theme
- New Cursor Theme
- New Original Sounds Theme
- Brand Boot Logo
- Brand New Wallpapers
- Brand New Logo
- Brand New Dock
- Prebuilt apps added (Spotify, Discord, VLC, Chromium, VSCode)

## Usage

!Internet Access is required to run the scripts!

UNPACK ISO

      bash unpack.sh
      
Chroot

      bash chroot.sh

Inside Chroot Environment

      mount -t proc none /proc
      mount -t sysfs none /sys
      mount -t devpts none /dev/pts 

      sudo apt update

      sudo apt install git

      git clone http://github.com/Anemonastrum/RemasterUbuntu/

      cd RemasterUbuntu

      sudo bash startremaster.sh
      
REPACK ISO

      bash repack.sh

## References

https://help.ubuntu.com/community/LiveCDCustomization