#!/bin/bash

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
export ZDOTDIR=$HOME/.config/zsh

# Installing docker prerequisites
# TODO: Maybe I need to check that this actually works as intended, like is there an if-else check that needs to happen here?
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installing the necessary system packages
apt-get -y upgrade
apt-get install -y aptitude
cat $DIR/system-req.txt | xargs aptitude install -y


# Installing python scripts
python3 -m pip install -r $DIR/python-req.txt

# Running script as user to set up environment
#sudo -u ${1} $DIR/user-script.sh

# One more upgrade
apt-get -y upgrade

# Setting up the configuration
cp -r $DIR/nvim/ $HOME/.config/nvim/
cp -r $DIR/zsh/ $HOME/.config/zsh
