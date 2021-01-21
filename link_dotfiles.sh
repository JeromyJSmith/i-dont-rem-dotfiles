#! /bin/bash

rm ~/.bashrc
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bashrc_linux ~/.bashrc_linux
ln -s ~/dotfiles/bashrc_macos ~/.bashrc_macos

rm ~/.bash_profile
ln -s ~/dotfiles/bash_profile ~/.bash_profile

rm ~/.bash_aliases
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/bash_aliase_linux ~/.bash_aliases_linux
ln -s ~/dotfiles/bash_aliase_macoss ~/.bash_aliases_macos

rm ~/.vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc

ls -al ~/.{b,v,g}*
