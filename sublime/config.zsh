if ! [[ -f $ZSH/bin/sublime ]]
then
  # Symlink sublime to ~/.dotfiles/bin so we can run from terminal
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" $ZSH/bin/sublime
fi
