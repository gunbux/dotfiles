#!/bin/sh

# pacman.sh - Installed additional packages after arch-chrooted into the arch installation
# This script takes two arguments, the hostname and the locale to be installed
# e.g. pacman.sh alan en_US.UTF-8

host=$1
locale=$2

# Setting up of swapfile
truncate -s 0 /swap/swapfile
chattr +C /swap/swapfile
btrfs property set /swap/swapfile compression none
dd if=/dev/zero of=/swap/swapfile bs=1G count=8 status=progress
chmod 600 /swap/swapfile
mkswap /swap/swapfile
swapon /swap/swapfile

echo "/swap/swapfile none swap defaults 00" >> /etc/fstab

# Set up timezone
ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime
## TODO: Check if its a double dash flag
hwclock --systohc

# Generate locales
echo $locale >> /etc/locale.gen
locale-gen
echo "LANG=en_SG.UTF-8" >> /etc/locale.conf

# Generate host info
echo $host >> /etc/hostname
## TODO: sed hostinfo into /etc/hosts

# Packages to be installed
packages="grub grub-btrfs efibootmgr networkmanager network-manager-applet wireless-tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers git reflector bluez bluez-utils cups openssh xdg-utils xdg-user-dirs"

pacman -S $packages

# Remake image with btrfs flags
sed -i 's.modules=().*/modules=(btrfs)/' $/etc/mkinitcpio.conf
mkinitcpio -p linux

# Grub installation
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Enable systemd daemons for startup
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups
systemctl enable sshd

