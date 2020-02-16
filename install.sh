#!/bin/bash

# Move the config files to the home dir automatically
mv .zshrc ~
mv .config ~

# make bin dir and get micro install file
mkdir ~/bin
cd ~/bin;
curl https://getmic.ro > i.sh

# ask the user to make sure the file is safe
less i.sh
read -p "Is the file correct?" yn
case $yn in
    [Yy]* ) bash i.sh; break;;
    * ) exit;;
esac

# change shell to zsh
chsh -s /bin/zsh
