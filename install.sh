#!/bin/bash
# Move the config files to the home dir automatically
git submodule init
git submodule update
cp -r .emacs.d ~
mv .nanorc ~
mv .zshrc ~
mv .config ~

chsh -s /bin/zsh
