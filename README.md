## Linux Base 
- Ubuntu 22.04.1 Jammy [Link](http://releases.ubuntu.com/jammy/)

## Install pre-requisities

Mengupdate daftar paket:

      sudo apt-get update
      
Install QEMU-KVM dan Virtual Machine Manager:

      sudo apt-get install apparmor apparmor-utils bridge-utils libvirt-clients libvirt-daemon-system libguestfs-tools qemu-kvm virt-manager
      
Install Persyaratan ketat untuk kustomisasi:

      sudo apt-get install binwalk casper genisoimage live-boot live-boot-initramfs-tools squashfs-tools
