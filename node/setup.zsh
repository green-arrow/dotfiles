# Activate NVM
# We need to do readlink here because the .nvm directory is symlinked
# Solution: https://github.com/creationix/nvm/issues/855#issuecomment-160232254
# Actual issue: https://github.com/creationix/nvm/issues/617

export NVM_DIR=$(readlink "$HOME/.nvm")
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# By default, use the latest installed 4.x version
nvm use 4
