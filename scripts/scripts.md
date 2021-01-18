# Scripts
This folder contains all my personal scripts I use to speed up/automate my daily workflow.

## Install Scripts
The install scripts in this folder are meant for an Arch installation with btrfs filesystem, and bspwm as the wm of choice.

## List of scripts
- monitor.sh - toggle between laptop onitor and dual monitor setup
- bday.sh - check for birthdays
### Arch Install Scripts
- btrfs.sh - subvolume script that creates the initial btrfs subvolumes during installl
- pacstrap.sh - A script installing the packages required during an initial pacstrap from the Arch installation medium
- pacman.sh - The secondary install after chroot into the Arch install that sets up swapfiles, timezones, locales and host info
- nvidia.sh - Install script for the nvidia gpu setup, ensuring that optimus and power management are working.
- bloat.sh - Install script to install essentials such as yay and GUI applications
