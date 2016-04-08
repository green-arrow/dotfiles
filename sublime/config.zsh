if ! [[ -f $DOTFILES_ROOT/bin/sublime ]]
then
  # Symlink sublime to ~/.dotfiles/bin so we can run from terminal
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" $DOTFILES_ROOT/bin/sublime
fi

theme_path=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Theme\ -\ Fengshui
if ! [[ -d $theme_path ]]
then
  ln -s $DOTFILES_ROOT/sublime/fengshui-theme $theme_path
fi
