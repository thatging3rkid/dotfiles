#!/bin/bash
# Move the config files to the home dir automatically
git submodule init
cp -r .emacs.d ~
mv .nanorc ~
mv .zshrc ~

chsh -s /bin/zsh
