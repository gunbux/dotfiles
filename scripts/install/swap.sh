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

echo""
echo "Script complete. Removing script from home..."
rm /swap.sh
