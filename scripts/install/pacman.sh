#!/bin/sh

# pacman.sh - Installed additional packages after arch-chrooted into the arch installation
# This script takes two arguments, the hostname and the locale to be installed
# e.g. pacman.sh alan en_US.UTF-8

host=$1

# Generate locales
echo "Generating locales..."
echo "en_SG.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_SG.UTF-8" >> /etc/locale.conf
echo "Locales generated."
echo ""

# Generate host info
echo $host >> /etc/hostname

# Packages to be installed
packages="grub grub-btrfs efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers git reflector bluez bluez-utils cups openssh xdg-utils xdg-user-dirs"

echo "Installing packages. Packages to be installed are $packages"
pacman --noconfirm -S $packages

echo ""
echo "Script complete. Please proceed to modify /etc/hostsname and /etc/mkinitcpio.conf before remaking the linux image with mkinitcpio -p linux, then proceeding to the next step"
echo "Removing script from home..."
rm /pacman.sh
