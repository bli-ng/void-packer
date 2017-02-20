sfdisk /dev/sda << EOF
label: dos
, 200M, L, *
, , L,
EOF
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
yes | xbps-install -Sy -R http://repo.voidlinux.eu/current -r /mnt base-system grub
mount -t proc proc /mnt/proc
mount -t sysfs sys /mnt/sys
mount -o bind /dev /mnt/dev
mount -t devpts pts /mnt/dev/pts
mv /root/install.sh /mnt/install.sh
chmod +x /mnt/install.sh
chroot /mnt "/install.sh"
sync
sudo umount -R /mnt
