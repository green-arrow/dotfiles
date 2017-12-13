#!/bin/bash

# Load convenience output functions
. $DOTFILES_ROOT/lib/output.sh

# Setup vim configuration
if ! [ -d "~/.config/vim/bundle" ]; then
  info 'Installing Vundle.'

  mkdir -p ~/.config/vim/bundle
  ln -s $DOTFILES_ROOT/vim/init.vim ~/.vimrc

  # Setup Vundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  # Install Plugins
  info 'Installing vim plugins.'
  vim +PluginInstall +qall
else
  info 'Vundle already installed!'
fi

