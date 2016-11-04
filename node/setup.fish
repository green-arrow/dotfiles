# Activate NVM
# We need to do readlink here because the .nvm directory is symlinked
# Solution: https://github.com/creationix/nvm/issues/855#issuecomment-160232254
# Actual issue: https://github.com/creationix/nvm/issues/617

export NVM_DIR=(readlink "$HOME/.nvm")

if test -s "$NVM_DIR/nvm.sh"
  bass source "$NVM_DIR/nvm.sh" --no-use
end
