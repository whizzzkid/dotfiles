#!/bin/bash

# Git repos to update from source.
gitrepo=(".emacs.d" ".dotfiles" "emacs")

# Logging time
echo "Update Started At: $(date)"

# Installing apt-fast
apt-get install -y apt-fast

# System Update
apt-fast -y clean
apt-fast -y update
apt-fast -y upgrade
apt-fast -y dist-upgrade
apt-fast -y autoremove --purge
apt-fast -y autoclean

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
