#!/bin/bash
# Move the config files to the home dir automatically
mv -r .emacs.d ~
mv .nanorc ~
mv .zshrc ~

chsh -s /bin/zsh
