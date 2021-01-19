#!/bin/sh

# btrfs.sh - shell script for setting up btrfs subvolumes on arch

p=$1
##TODO: Error checking for $1 to ensure it is a working partition

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

echo "subvolumes created, list of snapshots is $(ls)"

# Unmounts partition for proper remounting with subvolumes
echo "Unmounting partitions..."
umount /mnt
echo "Partition unmounted. Script complete. Ending..."
