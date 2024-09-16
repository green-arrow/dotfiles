# Activate NVM
# We need to do readlink here because the .nvm directory is symlinked
# Solution: https://github.com/creationix/nvm/issues/855#issuecomment-160232254
# Actual issue: https://github.com/creationix/nvm/issues/617

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use 19 > /dev/null
corepack enable
