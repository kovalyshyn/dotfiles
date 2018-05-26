#!/usr/bin/env bash

echo "Deleting the old files"
rm ~/.vimrc
rm ~/.zshrc
rm -rf ~/.vim
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf

echo "Symlinking files"
ln -s ~/GitHub/dotfiles/vim ~/.vim
ln -s ~/GitHub/dotfiles/vimrc ~/.vimrc
ln -s ~/GitHub/dotfiles/zshrc ~/.zshrc
ln -s ~/GitHub/dotfiles/tmux ~/.tmux.conf
ln -s ~/GitHub/dotfiles/gitconfig ~/.gitconfig
ln -s ~/GitHub/dotfiles/gitignore ~/.gitignore
ln -s ~/GitHub/dotfiles/scripts ~/.scripts
ln -s ~/GitHub/dotfiles/config/i3 ~/.config/i3
ln -s ~/GitHub/dotfiles/i3blocks.conf ~/.i3blocks.conf
ln -s ~/GitHub/dotfiles/config/mpd ~/.config/mpd
ln -s ~/GitHub/dotfiles/ncmpcpp ~/.ncmpcpp
ln -s ~/GitHub/dotfiles/config/compton.conf ~/.config/compton.conf
ln -s ~/GitHub/dotfiles/Xdefaults ~/.Xdefaults
ln -s ~/GitHub/dotfiles/xinitrc ~/.xinitrc

echo "All done."
