#!/bin/bash

usage(){
	echo "This script installs and configures neovim dependencies and configure it in the following way:"
	echo "- It will set XDG_CONFIG_HOME to your home directory, create a nvim directory and place all configs there."
	echo "- It will install Plug to the correct directory"
	echo "usage:"
	echo "     ./install-configs.sh <default shell:bash,zsh>"
}

if [[ $# < 1 ]]
then
	echo "must provide the default shell"
	usage
	exit 1
fi

defaultShellConfig=~/.bashrc
if [[ $1 == "zsh" ]]
then
	defaultShellConfig=~/.zshrc
fi

echo "XDG_CONFIG_HOME=$HOME" >> $defaultShellConfig

echo "installing Plug.."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -pv ~/.config/nvim
cp -r * ~/.config/nvim
