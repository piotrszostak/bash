#!/bin/bash

# Function to check if a package is installed
package_installed() {
    pacman -Qs "$1" >/dev/null 2>&1
}

# Function to install a package if not already installed
install_package() {
    if ! package_installed "$1"; then
        sudo pacman -S --noconfirm "$1"
    else
        echo "Package $1 is already installed."
    fi
}

# Update system
sudo pacman -Syu --noconfirm

# Install X Window System packages
install_package xorg-server xterm xorg-xinit

# Install Fonts
install_package ttf-cascadia-code ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-monoid-nerd ttf-nerd-fonts-symbols ttf-opensans ttf-roboto

# Install Shells
install_package zsh fish

# Install Window Manager and Utilities
install_package i3-gaps i3status rofi picom dunst kitty thunar thunar-archive-plugin thunar-volman tumbler exa lxappearance dex

# Install System Management and Monitoring packages
install_package network-manager-applet flatpak blueman tldr neovim rsync xorg-xcolor glances

# Install Multimedia packages
install_package vlc

# Install Web browser
install_package firefox

# Install File Compression and Archiving packages
install_package zip unzip

# Install File Utilities
install_package ranger ncdu fd

# Install Image Manipulation and Viewing packages
install_package imagemagick feh

# Install Productivity Tools
install_package htop fzf neofetch

# Install Office Suite
install_package libreoffice-still

# Install Utilities
install_package rsync wget curl

# Install yay (AUR Helper)
if ! package_installed yay; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "Yay (AUR Helper) is already installed."
fi

# Enable NetworkManager service
sudo systemctl enable NetworkManager

# Enable UFW (Uncomplicated Firewall)
sudo systemctl enable ufw

# Set up autostart for i3, picom, dunst, nm-applet, rofi, and terminal emulator
echo "exec i3" >> ~/.xinitrc
echo "picom &" >> ~/.xinitrc
echo "dunst &" >> ~/.xinitrc
echo "nm-applet &" >> ~/.xinitrc
echo "rofi -show drun &" >> ~/.xinitrc
echo "exec kitty" >> ~/.config/i3/config

# Start X display manager
startx
