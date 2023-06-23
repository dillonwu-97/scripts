#!/bin/zsh

##################################################
# This script executes the following commands as the default user
##################################################
DIR=$(pwd)

# Install zshrc
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Moving the neovim configuration files to the correct location
mkdir ~/.config/nvim/
cp $DIR/init.vim ~/.config/nvim/init.vim

# Moving the tmux configuration files to the correct location
cp $DIR/tmux.conf ~/.tmux.conf

# Moving certain commands into zsh source file
ECHO_ARR=( "source ~/powerlevel10k/powerlevel10k.zsh-theme"
"alias vi=nvim"
"alias vim=nvim"
"alias python=python3"
"alias cdd=\'cd Desktop\'"
"alias dk=docker" )

for i in ${ECHO_ARR[@]}
do 
	echo ${i} >> ~/.zshrc
done

