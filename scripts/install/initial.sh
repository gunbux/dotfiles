#!/bin/sh

# initial.sh - Initial setup for arch install

echo "Setting timedatectl..."
timedatectl set-ntp true
echo "timedatectl set."
echo ""

echo "Syncing packages..."
pacman -Syyy
echo "Packages synced."
echo ""

echo "Setting up reflector mirrorlists..."
reflector -c Singapore -a 12 --sort rate --save /etc/pacman.d/mirrorlist
echo "Mirrorlists set."
echo ""

echo "intial.sh complete. Please proceed to formatting your partitions via cfdisk fdisk, before running btrfs.sh"
echo ""
