#!/bin/bash
gitrepo=(".emacs.d" ".dotfiles" "emacs")

# Updating repos
for i in "${gitrepo[@]}"
do
  cd $HOME"/"$i
  git pull origin master 
  git submodule update --recursive
  cd ~
done

Updating Emacs
cd $HOME"/emacs"
./autogen.sh
./configure
make
sudo make install
cd $HOME

# System Update
sudo apt-fast -y update
sudo apt-fast -y upgrade
sudo apt-fast -y dist-upgrade
sudo apt-fast -y autoremove
sudo apt-fast -y autoclean
