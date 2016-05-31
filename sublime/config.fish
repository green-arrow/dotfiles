if not test -f $DOTFILES_ROOT/bin/sublime
  # Symlink sublime to ~/.dotfiles/bin so we can run from terminal
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" $DOTFILES_ROOT/bin/sublime
end

set theme_path ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Theme\ -\ Fengshui
if not test -d $theme_path
  ln -s $DOTFILES_ROOT/sublime/fengshui-theme $theme_path
end
