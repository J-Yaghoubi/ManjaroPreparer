#! /bin/bash

# Update repository:
sudo pacman -Sqyu

# Install aur package manager
sudo pacman -Sq yay pamac

# Base system applications
sudo pacman -Sq git screenfetch zsh gparted net-tools copyq htop appimagelauncher latte-dock
yay -Sq nerdfetch pantheon-terminal translate-Sqhell http gitflow stacer powerline-fonts-git 

# Enable Firewall Protection
sudo pacman -S ufw
sudo pacman -S gufw
sudo systemctl enable ufw

# Icon set
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh

# Programming language

## python
sudo pacman -Sq python ipython python-pip virtualbox

### base python modules
sudo pip install -U pip
sudo pip install -U django flask sanic gunicorn pyfiglet shecan

## node.js
sudo pacman -Sq nodejs npm

# ClamAV antivirus
sudo pacman -Sq clamav clamtk

# Graphic tools
sudo pacman -Sq krita gimp
yay -Sq lorien-bin rnote

# Shecan dns :
sudo shecan update
sudo shecan list
sudo shecan set
sudo shecan verify

# Sochial applications
sudo pacman -Sq telegram-desktop discord

# Database

## postgresql
sudo pacman -Sq postgresql pgadmin4
sudo -u postgres -b 'initdb --locale $LANG -E UTF8 -D "/var/lib/postgres/data/"'
sudo systemctl start postgresql.service
sudo systemctl enable postgresql.service

## mongodb
yay -Sq mongodb-bin mongodb-compass
sudo systemctl start mongodb.service
sudo systemctl enable mongodb.service

## redis
sudo pacman -Sq redis
sudo systemctl start redis
sudo systemctl enable redis

## sqlite
sudo pacman -Sq sqlite

# Browsers
sudo pacman -Sq firefox links torbrowser-launcher
yay -Sq google-chrome
sudo pamac install brave-browser

# Office softwares
sudo pacman -Sq libreoffice-fresh

# Multimedia 
sudo pacman -Sq clementine vlc elisa simplescreenrecorder

# Development IDE
sudo pacman -Sq kate code

# Virtualization
sudo pacman -Sq docker docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo pacman -Sq virtualbox linux515-virtualbox-host-modules
sudo vboxreload

sudo pacman -S fuse2 gtkmm linux-headers pcsclite libcanberra 
yay -S --noconfirm --needed ncurses5-compat-libs
yay -S --noconfirm --needed vmware-workstation
sudo systemctl enable vmware-networks.service  vmware-usbarbitrator.service vmware-hostd.service
sudo modprobe -a vmw_vmci vmmon
sudo pacman -S $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-headers"}' ORS=' ')
sudo vmware-modconfig --console --install-all

# Server tools:
sudo pacman -Sq remmina
yay -Sq wrk

# Api client
yay -Sq insomnia

# VPN
yay -Sq cloudflare-warp-bin
yay -Sq windscribe-v2-bin
