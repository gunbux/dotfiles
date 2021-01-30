#!/bin/sh

# btrfs.sh - shell script for setting up btrfs subvolumes on arch
# USAGE: btrfs [main partition] [boot partition]

p=$1 # - var for main parition
b=$2 # - var for boot parition
##TODO: Error checking for $1 and $2 to ensure it is a working partition

# Mounts the partition
mount /dev/$p /mnt

echo "Mounted partition, beginning to create subvolumes"

# Create all the required subvolumes
btrfs su cr /mnt/@root
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
btrfs su cr /mnt/@srv
btrfs su cr /mnt/@opt
btrfs su cr /mnt/@tmp
btrfs su cr /mnt/@swap
btrfs su cr /mnt/@.snapshots

echo "subvolumes created, list of snapshots is $(ls /mnt)"
echo ""

# Unmounts partition for proper remounting with subvolumes
echo "Unmounting partitions..."
umount /mnt
echo "Partition unmounted."
echo ""

# Remount the partition with specific options and subvolumes
echo "Remounting partition with specific options..."
mount -o noatime,compress=lzo,space_cache,subvol=@root /dev/$p /mnt
echo "Root partition mounted"
echo ""

# Make directories for mounting the rest of the subvolumes
echo "Making directories for rest of the subvolumes..."
mkdir /mnt/{boot,home,var,srv,opt,tmp,swap,.snapshots}
echo ""

# Continue mounting the rest of the subvolumes
echo "Mounting remaining subvolumes..."
mount -o noatime,compress=lzo,space_cache,subvol=@home /dev/$p /mnt/home
mount -o noatime,compress=lzo,space_cache,subvol=@srv /dev/$p /mnt/srv
mount -o noatime,compress=lzo,space_cache,subvol=@tmp /dev/$p /mnt/tmp
mount -o noatime,compress=lzo,space_cache,subvol=@opt /dev/$p /mnt/opt
mount -o noatime,compress=lzo,space_cache,subvol=@.snapshots /dev/$p /mnt/.snapshots

mount -o nodatacow,subvol=@var /dev/$p /mnt/var
mount -o nodatacow,subvol=@swap /dev/$p /mnt/swap
echo "All subvolumes mounted"
echo ""

# Mount the boot partition into boot (For dual booting)
echo "Mounting boot partition..."
mount /dev/$b /mnt/boot

echo "All partitions mounted"
echo ""
# Print out lsblk to ensure subvolumes are mounted
lsblk

echo "Script complete. Please proceed to pacstrap.sh"
