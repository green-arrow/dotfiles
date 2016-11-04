#!/bin/bash

# Enable python support in neovim
pip install neovim
pip3 install neovim

# Setup neovim configuration
if ! [ -d "~/.config/nvim" ]; then
  mkdir -p ~/.config/nvim
  ln -s $DOTFILES_ROOD/nvim/init.vim ~/.config/nvim/init.vim

  # Setup vim-plug
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Install Plugins
  nvim +PlugInstall +qall

  # Install NPM dependencies for tern_for_vim
  pushd ~/.config/nvim/plugged/tern_for_vim
  npm install
  popd
fi

