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

# Installing the necessary system packages
apt-get -y upgrade
apt-get install -y aptitude
cat $DIR/system-req.txt | xargs aptitude install -y

# Installing python scripts
python3 -m pip install -r $DIR/python-req.txt

# Running script as user to set up environment
sudo -u ${1} $DIR/user-script.sh
