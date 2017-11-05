#!/bin/bash
# Move the config files to the home dir automatically
cp -r .emacs.d ~
mv .nanorc ~
mv .zshrc ~

chsh -s /bin/zsh
