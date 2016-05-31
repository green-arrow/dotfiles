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
if test ! $(which nvm)
then
  info 'Installing NVM'

  # Link NVM
  ln -s $DOTFILES_ROOT/node/nvm $NVM_DIR
else
  info 'NVM is already installed! (version $(nvm --version))'
fi

# Install and use Node 6.x by default
info 'Installing / using Node 6.x'
nvm install 6 > /dev/null && nvm use 6 > /dev/null

# Install some basic NPM packages
info 'Installing NPM packages: ember-cli, bower, phantomjs, tern, babel, babel-eslint, eslint, eslint-config-ember, jscs'
npm install -g ember-cli bower phantomjs tern babel babel-eslint eslint eslint-config-ember jscs redux-cli 1> /dev/null
