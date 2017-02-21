#!/bin/bash

# Git repos to update from source.
gitrepo=(".emacs.d" ".dotfiles" "emacs")

# Logging time
echo "Update Started At: $(date)"

# System Update
sudo apt -y clean
sudo apt -y update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt -y autoremove --purge
sudo apt -y autoclean

# Updating Installs from sources.
present=$(pwd)

# Updating repos
for i in "${gitrepo[@]}"
do
  echo "Pulling /home/whizzzkid/"$i
  cd "/home/whizzzkid/"$i
  git pull origin master
  git submodule update --recursive
  cd ~
done

# Building emacs from source.
echo "Updating Emacs..."
cd "/home/whizzzkid/emacs"
./autogen.sh all > /dev/null
./configure --with-gnutls=no > /dev/null
make install > /dev/null
cd $present
echo "Latest Emacs Installed"

# Logging finish
echo "Update Completed At $(date)"
