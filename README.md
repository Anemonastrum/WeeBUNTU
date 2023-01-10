## Linux Base 
- Ubuntu 22.04.1 Jammy

## Install pre-requisities

Update the package lists:

      sudo apt-get update
      
Install QEMU-KVM and Virtual Machine Manager:

      sudo apt-get install apparmor apparmor-utils bridge-utils libvirt-clients libvirt-daemon-system libguestfs-tools qemu-kvm virt-manager
      
Strict requirements for customisation:

      sudo apt-get install binwalk casper genisoimage live-boot live-boot-initramfs-tools squashfs-tools
