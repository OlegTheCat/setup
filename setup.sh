#!/bin/bash

wget -O skype.deb https://get.skype.com/go/getskype-linux-ubuntu-64
wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb

sudo apt-get update

sudo dpkg -i skype.deb
sudo dpkg -i dropbox.deb

sudo apt-get install -f

rm skype.deb dropbox.deb


sudo apt-get install git gitk

git config --global user.email "oleh.palianytsia@gmail.com"
git config --global user.name "Oleh Palianytsia"


mkdir -p ~/devel
cd ~/devel

git clone https://github.com/emacs-mirror/emacs.git

cd emacs
git checkout emacs-25

sudo apt-get install aptitude
sudo aptitude build-dep emacs24

./autogen.sh
./configure --with-png=no --with-tiff=no
make -j8
sudo make install
cd
