#!/bin/sh
#
# oh-my-zsh
#
# This symlinks oh-my-zsh to the proper install location

# Load convenience output functions
. $DOTFILES_ROOT/lib/output.sh

OH_MY_ZSH="$HOME/.oh-my-zsh"

# Check for oh-my-zsh
if ! [ -d $OH_MY_ZSH ]; then
  info 'Installing oh-my-zsh'
  ln -s "$DOTFILES_ROOT/zsh/modules/oh-my-zsh" "$HOME/.oh-my-zsh"
fi

# Check for zsh-completions
if ! [ -d "$OH_MY_ZSH/custom/plugins/zsh-completions" ]; then
  info 'Installing zsh-completions'
  ln -s "$DOTFILES_ROOT/zsh/modules/zsh-completions" "$OH_MY_ZSH/custom/plugins/zsh-completions"
fi

# Check for zsh-syntax-highlighting
if ! [ -d "$OH_MY_ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
  info 'Installing zsh-syntax-highlighting'
  ln -s "$DOTFILES_ROOT/zsh/modules/zsh-syntax-highlighting" "$OH_MY_ZSH/custom/plugins/zsh-syntax-highlighting"
fi
