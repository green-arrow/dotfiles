alias gst="git status"
alias gco="git checkout"
alias gitclean="git branch --merged develop | grep -v \"develop\" | xargs -n 1 git branch -d; and git remote prune origin"
