#!/bin/bash

#############################################
# This file bootstraps a Linux system so that it has all of the desired packages
# It requires sudo permissions to run
# 
# To run:
#	./bootstrap.sh $USER
#############################################


if [ -z "$1" ]
then
	echo "No users supplied"
	exit 1
fi

# Setup
DIR=$(pwd)
BASHRC=~/.bashrc
ZSHRC=~/.zshrc

# Installing docker prerequisites
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
