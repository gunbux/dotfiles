#!/bin/sh

# get-script.sh  - gets the different scripts via curl to its respective places for proper arch installation

echo "Getting scripts for Arch installation..."
curl https://raw.githubusercontent.com/gunbux/dotfiles/testing/scripts/install/btrfs.sh -o btrfs.sh
curl https://raw.githubusercontent.com/gunbux/dotfiles/testing/scripts/install/initial.sh -o initial.sh
curl https://raw.githubusercontent.com/gunbux/dotfiles/testing/scripts/install/pacstrap.sh -o pacstrap.sh
curl https://raw.githubusercontent.com/gunbux/dotfiles/testing/scripts/install/swap.sh -o swap.sh
curl https://raw.githubusercontent.com/gunbux/dotfiles/testing/scripts/install/pacman.sh -o pacman.sh
curl https://raw.githubusercontent.com/gunbux/dotfiles/testing/scripts/install/install.sh -o install.sh

# Change permisions for all shell scripts
chmod 777 btrfs.sh
chmod 777 initial.sh
chmod 777 pacstrap.sh
chmod 777 swap.sh
chmod 777 pacman.sh
chmod 777 install.sh

echo "Script complete."
