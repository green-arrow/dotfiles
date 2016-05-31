#!/bin/sh
#
# oh-my-fish
#
# This installs the oh-my-fish manager for the fish shell

# Load convenience output functions
. $DOTFILES_ROOT/lib/output.sh

# Check for fisherman
if test ! $(which fisher)
then
  info 'Installing / setting up fish and fisherman for you.'

  brew install fish

  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

  ln -s "$DOTFILES_ROOT/fish/config.masterfish" ~/.config/fish/config.fish
  ln -s "$DOTFILES_ROOT/fish/fishfile" ~/.config/fish/fishfile
  fisher
else
  info "fisherman is already installed!"
fi

exit 0



