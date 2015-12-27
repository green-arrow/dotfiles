# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

# Load convenience output functions
. $ZSH/lib/output.sh

info 'Updating apps / installables from the Mac App Store (sudo softwareupdate -i -a)'
sudo softwareupdate -i -a
