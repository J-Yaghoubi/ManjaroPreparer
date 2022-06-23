#! /bin/bash

# Repositories -----------------------------------------------------------------------------

## pacman
sudo pacman -Sqyu

## snapcraft
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# aur
sudo pacman -Sq yay pamac


# General Solutions ------------------------------------------------------------------------

## daily assistances
sudo pacman -Sq git screenfetch zsh gparted net-tools copyq htop appimagelauncher latte-dock
yay -Sq nerdfetch pantheon-terminal translate-Sqhell http gitflow stacer powerline-fonts-git 

## icon set
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh

## Office softwares
sudo pacman -Sq libreoffice-fresh

## Multimedia 
sudo pacman -Sq clementine vlc elisa simplescreenrecorder

# Graphic tools
sudo pacman -Sq krita gimp
yay -Sq lorien-bin rnote


# Social networks --------------------------------------------------------------------------

## Telegram
sudo snap install telegram-desktop


# Programing utilities ---------------------------------------------------------------------

## python
sudo pacman -Sq python ipython python-pip virtualbox

## python modules
sudo pip install -U pip
sudo pip install -U django flask sanic gunicorn pyfiglet shecan

## IDE: VS-Code
sudo snap install code --classic

## IDE: Kate
sudo pacman -Sq kate code


# Databases --------------------------------------------------------------------------------

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


# Internet ---------------------------------------------------------------------------------

## Shecan dns :
sudo shecan update
sudo shecan list
sudo shecan set
sudo shecan verify

## VPN
yay -Sq cloudflare-warp-bin
yay -Sq windscribe-v2-bin

## Browsers
sudo pacman -Sq firefox links torbrowser-launcher
yay -Sq google-chrome
sudo pamac install brave-browser

## Server tools
sudo pacman -Sq remmina
yay -Sq wrk

## Api client
yay -Sq insomnia


# Security --------------------------------------------------------------------------------

# ClamAV antivirus
sudo pacman -Sq clamav clamtk


# Virtualization --------------------------------------------------------------------------

# docker
sudo pacman -Sq docker docker-compose
sudo systemctl start docker
sudo systemctl enable docker

# virtualbox
sudo pacman -Sq virtualbox linux515-virtualbox-host-modules
sudo vboxreload




