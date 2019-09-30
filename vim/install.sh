#!/bin/bash

# Load convenience output functions
. $DOTFILES_ROOT/lib/output.sh

# Setup vim configuration
if ! [ -d "~/.config/nvim" ]; then
  info 'Installing and configuring vim + neovim.'

  mkdir -p ~/.config/nvim/plugged
  ln -s ~/.config/nvim ~/.vim
  ln -s $DOTFILES_ROOT/vim/init.vim ~/.config/nvim/init.vim
  ln -s $DOTFILES_ROOT/vim/.vimrc ~/.vimrc

  info 'Intalling vim-plug.'

  # Setup vim-plug
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Install Plugins
  info 'Installing vim + neovim plugins.'
  nvim +PlugInstall +qall
  vim +PlugInstall +qall
else
  info 'vim + neovim already configured!'
fi

