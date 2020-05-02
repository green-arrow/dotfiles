#!/bin/sh
#
# asdf
#
# This installs the ASDF version manager with the elixir plugin

# Load convenience output functions
. $DOTFILES_ROOT/lib/output.sh

ASDF_DIR="$HOME/.asdf"

# Check for nvm
if [ ! -d $ASDF_DIR ]
then
  info 'Installing ASDF'

  # Install ASDF and make the appropriate scripts executable
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.6.2
  chmod +x $HOME/.asdf/asdf.sh
  chmod +x $HOME/.asdf/completions/asdf.bash

  # Add the elixir and elixir plugins for ASDF
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
else
  info 'ASDF is already installed! (version $(asdf --version))'
fi
