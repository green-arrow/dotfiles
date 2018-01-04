#!/bin/sh
#
# zgen
#
# This installs zgen for package management for zsh

# Load convenience output functions
. $DOTFILES_ROOT/lib/output.sh

# Check for zgen
if ! [ -d "~/.zgen" ]; then
  info 'Installing / setting up zgen.'

  git clone https://github.com/tarjoilija/zgen.git "~/.zgen"
else
  info "zgen is already installed!"
fi

exit 0



