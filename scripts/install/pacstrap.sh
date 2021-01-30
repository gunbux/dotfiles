#!/bin/sh

# pacstrap.sh - script for the initial pacstrap before the arch-chroot

# List of packages to be installed. Be sure to change out amd-ucode if using something other than an AMD CPU/APU

packages="base linux linux-firmware amd-ucode vim btrfs-progs"

# Refresheys for older arch isos
echo "Refreshing keys"
pacman-keys --populate
pacman-keys --refresh-keys
echo "Packages to be installed: $packages"
echo ""
# Install packages into mnt
pacstrap /mnt $packages

echo "Packages installed"
echo ""

echo "Inserting remaining install scripts into mountpoint..."
mv pacman.sh /mnt
mv swap.sh /mnt
mv install.sh /mnt

# Generate fstab for installation - Do this only after you are sure that all the subvolumes have been mounted properly
echo "Generating fstab..."
genfstab -U /mnt >> /mnt/etc/fstab

# Check if fstab is correct
echo ""
echo "fstab generated. Outputting fstab:"
cat /mnt/etc/fstab

echo "Script completed. Please proceed to arch-chroot into installation."
