#!/bin/bash

# Install Skype for Linux
# Created by davidc
# Version 1; Release Date: 7/18/2020
# Script to install Skype on Manjaro using the instructions found in these links:
mainLink="https://linuxconfig.org/how-to-install-skype-on-manjaro-18-linux"
otherLink="https://classicforum.manjaro.org/index.php?topic=3216.0"

function installScript(){
 echo "INSTALLING SKYPE FOR MANJARO LINUX"; sleep 1
 echo "SCRIPT REFERENCE: $mainLink"
 echo "SCRIPT REFERENCE: $otherLink"; sleep 1
 git clone https://aur.archlinux.org/skypeforlinux-stable-bin
 sudo pacman -S base-devel
 (cd skypeforlinux-stable-bin/ && makepkg -s)
 sudo chmod 777 ~/skypeforlinux-stable-bin/*
 skypeTarPackage=$( ls ~/skypeforlinux-stable-bin/*pkg.tar.xz )
 skypeTarPackage=$( echo ${skypeTarPackage##*/} )
 sudo pacman -U --noconfirm ~/skypeforlinux-stable-bin/$skypeTarPackage
 echo -e "\nskypeforlinux installed\n"
}

installScript

