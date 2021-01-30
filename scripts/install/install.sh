#!/bin/sh

# install.sh - Installs the grub bootloader and starts up necessary systemd daemons.
echo "Installing Grub..."
# Grub installation
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo "Grub installed."
echo ""

# Enable systemd daemons for startup
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups
systemctl enable sshd

echo Script completed. Please proceed to the next step.""
