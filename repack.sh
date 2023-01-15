#! /usr/bin/env bash

#Variable
NAMADISTRO="WeeBUNTU"

sleep 1
printf "\n \n Repacking Started.... \n \n"
read -p 'ISO NAME: ' NAMAISO
read -p 'OUTPUT NAME: ' OUTPUTISO
sudo umount edit/run
sudo umount edit/dev
printf "\n \n Prepairing Environment.... \n \n"
sudo su
sudo chmod +w extracted/casper/filesystem.manifest
sudo chroot edit dpkg-query -W --showformat='${Package} ${Version}\n' > extracted/casper/filesystem.manifest
sudo cp extracted/casper/filesystem.manifest extracted/casper/filesystem.manifest-desktop
sudo sed -i '/ubiquity/d' extracted/casper/filesystem.manifest-desktop
sudo sed -i '/casper/d' extracted/casper/filesystem.manifest-desktop
printf "\n \n Removing Existing filesystem.... \n \n"
sudo rm extracted/casper/filesystem.squashfs
sudo rm extracted/casper/filesystem.squashfs.gpg
printf "\n \n Compiling new filesystem.... \n \n"
sudo mksquashfs edit extracted/casper/filesystem.squashfs -comp xz
sudo printf $(du -sx --block-size=1 edit | cut -f1) > extracted/casper/filesystem.size
printf "\n \n signing new compiled filesystem.... \n \n"
sudo gpg --local-user 2551D59A01F3022FAFB75644F440B26DF14188A2 --output extracted/casper/filesystem.squashfs.gpg --detach-sign extracted/casper/filesystem.squashfs
printf "\n \n Generating new filesystem data size.... \n \n"
sudo printf $(du -sx --block-size=1 edit | cut -f1) > extracted/casper/filesystem.size
printf "\n \n Editing new variables.... \n \n"
nano extracted/README.diskdefines
printf "\n \n Generating new MD5 HASH.... \n \n"
cd extracted
sudo rm md5sum.txt
sudo find -type f -print0 | xargs -0 md5sum | grep -v isolinux/boot.cat | tee md5sum.txt
cd ..
sleep 1
printf "\n \n Getting MBR partition from the '$NAMAISO' \n \n"
sudo dd bs=1 count=446 if="$NAMAISO" of=mbr.img
printf "\n \n Getting EFI partition from the '$NAMAISO' \n \n"
sudo dd bs=512 count=8496 skip=7465120 if="$NAMAISO" of=EFI.img
printf "\n \n Analyzing Unmodified ISO \n \n"
sudo xorriso -indev "$NAMAISO" -report_el_torito cmd
printf "\n \n Compiling '$OUTPUTISO' .... \n \n"
sudo xorriso -outdev "$OUTPUTISO" -map extracted / -- -volid "$NAMADISTRO" -boot_image grub grub2_mbr=mbr.img -boot_image any partition_table=on -boot_image any partition_cyl_align=off -boot_image any partition_offset=16 -boot_image any mbr_force_bootable=on -append_partition 2 28732ac11ff8d211ba4b00a0c93ec93b EFI.img -boot_image any appended_part_as=gpt -boot_image any iso_mbr_part_type=a2a0d0ebe5b9334487c068b6b72699c7 -boot_image any cat_path='/boot.catalog' -boot_image grub bin_path='/boot/grub/i386-pc/eltorito.img' -boot_image any platform_id=0x00 -boot_image any emul_type=no_emulation -boot_image any load_size=2048 -boot_image any boot_info_table=on -boot_image grub grub2_boot_info=on -boot_image any next -boot_image any efi_path=--interval:appended_partition_2:all:: -boot_image any platform_id=0xef -boot_image any emul_type=no_emulation -boot_image any load_size=4349952
printf "\n \n Generating '$OUTPUTISO' SHA512SUM.... \n \n"
sha512sum "$OUTPUTISO" >> "$OUTPUTISO".sha512
gpg --local-user 2551D59A01F3022FAFB75644F440B26DF14188A2 --output "$OUTPUTISO".sha512.gpg --detach-sign "$OUTPUTISO".sha512



