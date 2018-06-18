alias view_deleted_branches="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}'"
alias clean_deleted_branches="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"
alias force_clean_deleted_branches="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d --force"
