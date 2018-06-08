#!/usr/bin/env bash

echo "Deleting the old files"
rm ~/.vimrc
rm ~/.zshrc
rm -rf ~/.vim
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf

echo "Copy config files"
cp -rf vim ~/.vim
cp -rf vimrc ~/.vimrc
cp -rf zshrc ~/.zshrc
cp -rf tmux ~/.tmux.conf
cp -rf gitconfig ~/.gitconfig
cp -rf gitignore ~/.gitignore
cp -rf scripts ~/.scripts
cp -rf config/i3 ~/.config/i3
cp -rf i3blocks.conf ~/.i3blocks.conf
cp -rf config/mpd ~/.config/mpd
cp -rf ncmpcpp ~/.ncmpcpp
cp -rf config/compton.conf ~/.config/compton.conf
cp -rf config/dunst ~/.config/dunst
cp -rf Xdefaults ~/.Xdefaults
cp -rf xinitrc ~/.xinitrc

echo "All done."
