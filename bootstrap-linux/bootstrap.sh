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
	echo "No user supplied"
	exit 1
fi

# Setup
DIR=$(pwd)
BASHRC=~/.bashrc
ZSHRC=~/.zshrc


# Installing the necessary system packages
#apt-get -y upgrade
#apt-get install -y aptitude
#cat $DIR/system-req.txt | xargs aptitude install -y

# Installing oh-my-zsh

#sudo -u ${1} sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
#sudo -u ${1} git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
ZSH_CMDS=("wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -"
"git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k"
"echo \"source ~/powerlevel10k/powerlevel10k.zsh-theme\" >>~/.zshrc"
)
for cmd in "${ZSH_CMDS[@]}"
do
	$cmd
done


# Configuring bashrc file and zshrc file
# For each command, do for ~/.bashrc file and ~/.zshrc file
# Create an array of commands maybe

#echo 'alias python=python' >> ~/.bashrc



# TODO: Modify the ~/bashrc file so that it contains all of the correct aliases
# TODO: Place the correct configuration files in the right directory - tmux, neovim
# Get rid of the beep sound
