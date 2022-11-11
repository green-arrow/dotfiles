alias view_deleted_branches="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}'"
alias clean_deleted_branches="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"
alias force_clean_deleted_branches="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d --force"

# "Git Update Main" - Updates main branch and maintains current branch
alias gum='current_branch=`git branch --show-current`;gco main && git pull && gco $current_branch'

# "Git Update Main & Merge" - Updates main branch and merges with current branch
alias gumm='gum && git merge main'
