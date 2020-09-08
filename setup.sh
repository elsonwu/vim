#!/bin/bash

# common tools
brew install vim ripgrep fzf

# font install
brew tap homebrew/cask-fonts
brew cask install font-jetbrains-mono

# install plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# plugins install
vim -c PlugInstall
