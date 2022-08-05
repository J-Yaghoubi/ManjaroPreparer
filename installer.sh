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
sudo pacman -Sq screenfetch gparted net-tools copyq htop appimagelauncher latte-dock
yay -Sq translate-Sqhell http stacer powerline-fonts-git 

## icon set
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh

## Office softwares
sudo pacman -Sq libreoffice-fresh

## multimedia 
sudo pacman -Sq clementine vlc elisa simplescreenrecorder

# graphic tools
sudo pacman -Sq krita gimp
yay -Sq lorien-bin rnote

# Enable TRIM for SSD
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer


# Social networks --------------------------------------------------------------------------

## Telegram
sudo snap install telegram-desktop


# Konsole customization --------------------------------------------------------------------

## zsh
sudo pacman -Syu zsh

## Oh My ZSH and its plugins
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)

## Add custom text to head of konsole
yay -S figlet
yay -S lolcat
echo figlet '<Your prefared text>' | lolcat >> ~/.zshrc


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

## Version control
yay -S git
yay -S gitflow


# Databases --------------------------------------------------------------------------------

## postgresql
sudo pacman -S postgresql
sudo -iu postgres
initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data/'
exit
sudo systemctl start postgresql.service
sudo systemctl enable --now postgresql.service

## pgadmin
sudo mkdir /var/lib/pgadmin
sudo mkdir /var/log/pgadmin
sudo chown $USER /var/lib/pgadmin
sudo chown $USER /var/log/pgadmin
python3 -m venv pgadmin4
source pgadmin4/bin/activate
pip install pgadmin4
cd pgadmin4
pgadmin4

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

## Nmap
sudo pacman -S nmap

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
sudo pacman -Sq firefox
yay -Sq google-chrome

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
