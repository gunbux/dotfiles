#!/bin/sh

# pacstrap.sh - script for the initial pacstrap before the arch-chroot

# List of packages to be installed. Be sure to change out amd-ucode if using something other than an AMD CPU/APU

packages="base linux linux-firmware and-ucode neovim btrfs-progs"

echo "Packages to be installed: $packages"
# Install packages into mnt
pacstrap /mnt $packages

echo "Packages installed"

# Generate fstab for installation - Do this only after you are sure that all the subvolumes have been mounted properly
echo "Generating fstab..."
genfstab -U /mnt >> /mnt/etc/fstab

# Check if fstab is correct
echo "fstab generated. Outputting fstab:"
cat /mnt/etc/fstab

