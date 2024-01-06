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


debug=false
while getopts 'f' flag; do
    case "${flag}" in
        f) debug=true ;;
        *) echo "Unrecognized flag" && exit 1 ;;
    esac
done


# if we are in debug mode, just remove everything and then rerun the script
if [[ "$debug" = true ]]; then
    echo "Debug mode"
    rm /etc/apt/keyrings/docker.gpg
    cat $DIR/system-req.txt | xargs aptitude uninstall -y
    python3 -m pip uninstall -r $DIR/python-req.txt
fi


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
apt-get -y upgrade
apt-get install -y aptitude
cat $DIR/system-req.txt | xargs aptitude install -y


# Installing python scripts
echo "[*] Installing python packages"
python3 -m pip install -r $DIR/python-req.txt

# One more upgrade
apt-get -y upgrade

# Setting up the configuration
echo "[*] Copying configuration files"
cp -r $DIR/nvim/ $HOME/.config/nvim/
cp -r $DIR/zsh/ $HOME/.config/zsh
