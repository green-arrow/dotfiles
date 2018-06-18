#!/bin/sh
#
# nvm
#
# This installs the Node Version Manager and the latest 4.x version of node,
# as well as some basic NPM packages used for front-end development

# Load convenience output functions
. $DOTFILES_ROOT/lib/output.sh

NVM_DIR="$HOME/.nvm"

# Check for nvm
if [ ! -d $NVM_DIR ]
then
  info 'Installing NVM'

  # Link and activate NVM
  ln -s $DOTFILES_ROOT/node/nvm $NVM_DIR && . $NVM_DIR/nvm.sh
else
  source $NVM_DIR/nvm.sh
  info 'NVM is already installed! (version $(nvm --version))'
fi

# Install and use Node 8.x by default
info 'Installing / using Node 8.x'
nvm install 10 > /dev/null && nvm use 10 > /dev/null
