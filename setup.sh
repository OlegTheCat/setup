#!/bin/bash

#
# Git
#

sudo apt-get install git gitk

git config --global user.email "oleh.palianytsia@gmail.com"
git config --global user.name "Oleh Palianytsia"

#
# Emacs
#

mkdir -p ~/devel
cd ~/devel

git clone https://github.com/emacs-mirror/emacs.git

cd emacs
git checkout emacs-25

sudo apt-get install aptitude
sudo aptitude build-dep emacs24

./autogen.sh
./configure
make -j8
sudo make install
cd
git clone --recursive https://github.com/OlegTheCat/.emacs.d.git

#
# Fstab config
#

sudo mkdir -p /media/files
sudo echo "/dev/sda3   /media/files  ntfs    defaults    0   0" >> /etc/fstab

#
# Skype & Dropbox
#

wget -O skype.deb https://get.skype.com/go/getskype-linux-ubuntu-64
wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb

sudo apt-get update

sudo dpkg -i skype.deb
sudo dpkg -i dropbox.deb

sudo apt-get install -f

rm skype.deb dropbox.deb

#
# Steam
#

wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
sudo dpkg -i steam.deb
rm steam.deb

#
# Lein
#

wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo mv lein /usr/bin/
sudo chmod +x /usr/bin/lein

#
# Misc
#

sudo apt-get install screen
sudo apt-get install shutter
