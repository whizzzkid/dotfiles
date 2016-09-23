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

echo "Updating Emacs..."
cd $HOME"/emacs"
./autogen.sh all
./configure --with-gnutls=no
sudo make install
cd $HOME

# System Update
sudo apt-fast -y update
sudo apt-fast -y upgrade
sudo apt-fast -y dist-upgrade
sudo apt-fast -y autoremove
sudo apt-fast -y autoclean
