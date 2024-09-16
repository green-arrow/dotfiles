[ -f ~/.zgen/zgen.zsh ] && source ~/.zgen/zgen.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# if the init scipt doesn't exist
if ! zgen saved; then

  # Base for oh-my-zsh
  zgen oh-my-zsh

  # Plugins for oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/macos
  zgen oh-my-zsh plugins/asdf
  zgen oh-my-zsh plugins/history-substring-search
  zgen oh-my-zsh plugins/jsontools
  zgen oh-my-zsh plugins/z

  # Non oh-my-zsh plugins
  zgen load romkatv/powerlevel10k powerlevel10k

  # generate the init script from plugins above
  zgen save
fi

# Add git branch info to prompt
# export PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '

# Add git indicators to prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose"

# Add keybindings for history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
