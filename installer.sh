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

## multimedia 
sudo pacman -Sq clementine vlc elisa simplescreenrecorder

# graphic tools
sudo pacman -Sq krita gimp
yay -Sq lorien-bin rnote


# Social networks --------------------------------------------------------------------------

## Telegram
sudo snap install telegram-desktop


# Programing utilities ---------------------------------------------------------------------

## python
sudo pacman -Sq python ipython python-pip

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

# Network ---------------------------------------------------------------------------------

## Wireshark: install and enable capture packets
sudo pacman -S wireshark-qt
sudo chmod +x /usr/bin/dumpcap

##
sudo pacman -S nmap
pamac install ettercap-gtk

# Uncomplicated FireWall: install, enable, add to startup
sudo pamac install ufw 
sudo pamac install gufw 
sudo ufw enable
sudo systemctl enable ufw


# Internet ---------------------------------------------------------------------------------

## Shecan dns :
sudo shecan update
sudo shecan list
sudo shecan set
sudo shecan verify

## VPN
sudo pacman -S openvpn dialog python-pip python-setuptools
sudo pip3 install protonvpn-cli

## Browsers
sudo pacman -Sq firefox links torbrowser-launcher
yay -Sq google-chrome
sudo pamac install brave-browser

## Server tools
sudo pacman -Sq remmina
yay -Sq wrk

## Api client
yay -Sq insomnia


# Virtualization --------------------------------------------------------------------------

# docker
sudo pacman -Sq docker docker-compose
sudo systemctl start docker
sudo systemctl enable docker

# virtualbox
sudo pacman -Sq virtualbox linux515-virtualbox-host-modules
sudo vboxreload

# vmware-workstation
sudo pacman -S fuse2 gtkmm linux-headers pcsclite libcanberra
yay -S --noconfirm --needed ncurses5-compat-libs
yay -S --noconfirm --needed vmware-workstation
sudo modprobe -a vmw_vmci vmmon

sudo systemctl enable vmware-networks.service  vmware-usbarbitrator.service vmware-hostd.service
sudo systemctl start vmware-networks.service  vmware-usbarbitrator.service vmware-hostd.service

sudo pacman -S $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-headers"}' ORS=' ')
sudo vmware-modconfig --console --install-all





