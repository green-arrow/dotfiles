#!/bin/bash

if test "$(uname)" = "Darwin"
then
  cp $DOTFILES_ROOT/patched_fonts/Input-Mono/* ~/Library/Fonts
  cp $DOTFILES_ROOT/patched_fonts/FiraCode/* ~/Library/Fonts
else
  mkdir -p ~/.fonts
  cp $DOTFILES_ROOT/patched_fonts/Input-Mono/* ~/.fonts
  cp $DOTFILES_ROOT/patched_fonts/FiraCode/* ~/.fonts
fi
