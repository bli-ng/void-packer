echo "root:rootpass" | chpasswd -c SHA512
chown root:root /
chmod 755 /
useradd vagrant
echo "vagrant:vagrant" | chpasswd -c SHA512
echo "void-test" > /etc/hostname
echo 'HOSTNAME="void-test"' > /etc/rc.conf
echo 'HARDWARECLOCK="UTC"' >> /etc/rc.conf
echo 'TIMEZONE="America/Chicago"' >> /etc/rc.conf
echo 'KEYMAP="us"' >> /etc/rc.conf
echo "/dev/sda1	 /boot	vfat	defaults	0	2" >> /etc/fstab
echo "/dev/sda2	 /		ext4	defaults	0	1" >> /etc/fstab
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/default/libc-locales
echo 'hostonly="yes"' >> /etc/dracut.conf
xbps-reconfigure -f glibc-locales
grub-install /dev/sda
xbps-reconfigure -f linux4.9-4.9.11_1
