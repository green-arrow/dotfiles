#!/bin/sh
#
# slack
#
# This installs the dark theme for slack

# Load convenience output functions
. $DOTFILES_ROOT/lib/output.sh

SLACK_DIR="/Applications/Slack.app/Contents"
SLACK_STYLE_FILE="$SLACK_DIR/resources/app.asar.unpacked/src/static/ssb-interop.js"

# Check for nvm
if [ -d $SLACK_DIR ]
then
  info 'Checking to see if dark mode is already installed...'

  if grep -q "// SLACK DARK MODE LOADER" $SLACK_STYLE_FILE
  then
    info 'Dark mode already installed'
  else
    info 'Dark mode not installed, installing now...'

    cat $DOTFILES_ROOT/slack/dark-mode-loader.js >> $SLACK_STYLE_FILE

    success 'Dark mode successfully installed!'
  fi
else
  fail "Slack application is not installed at $SLACK_DIR"
fi
