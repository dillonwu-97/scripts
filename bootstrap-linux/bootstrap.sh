#!/bin/bash

# TODO: Maybe move all of these functions into their own separate file?
# Install / set up golang and rust as well?
# Ghidra install 

#############################################
# This file bootstraps a Linux system so that it has all of the desired packages
# It requires sudo permissions to run
# 
# To run:
#    chmod u+s bootstrap.sh
#	./bootstrap.sh
#############################################

# if length of the $HOME variable is 0
if [ -z "$HOME" ]
then
    echo "No home environment variable set"
    exit 1
fi

# Setup
DIR=$(pwd)

# Installing docker prerequisites
# TODO: Maybe I need to check that this actually works as intended, like is there an if-else check that needs to happen here?
echo "[*] Grabbing docker gpg key"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installing the necessary system packages
echo "[*] Installing system packages" 
apt-get update
apt-get -y upgrade
count = 0
while read -r package; do
    printf "%s{count}" | tr ' ' "*"
    echo
    apt-get install -y -f $package || echo "Failed to install $package"
done < "$DIR/system-req.txt"

# Installing python scripts
echo "[*] Installing python packages"
#total=$(wc -l < $DIR/system-req.txt)
while read -r package; do
    python3 -m pip install $package
done < "$DIR/python-req.txt"

# One more upgrade
apt-get -y upgrade

# Setting up the configuration
echo "[*] Copying configuration files"
cp -r $DIR/nvim/ $HOME/.config/nvim/
cp -r $DIR/zsh/ $HOME/.config/zsh
