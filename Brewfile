cask_args appdir: '/Applications'

tap 'caskroom/cask'
tap 'caskroom/versions'
tap 'homebrew/bundle'


# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew 'coreutils'

# Install some other useful utilities like `sponge`.
brew 'moreutils'

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew 'findutils'

# Install GNU `sed`, overwriting the built-in `sed`.
brew 'gnu-sed', args: ['with-default-names']

# Install `wget` with IRI support.
brew 'wget', args: ['with-iri']

# Install more recent versions of some OS X tools.
brew 'vim', args: ['override-system-vi']
brew 'homebrew/dupes/grep'
brew 'homebrew/dupes/openssh'
brew 'homebrew/dupes/screen'
brew 'ack'
brew 'lynx'
brew 'p7zip'
brew 'pv'
brew 'rename'
brew 'tree'

# Libraries
brew 'grc'
brew 'jp2a'
brew 'libgit2'
brew 'openssl'
brew 'readline'

# Development
brew 'watchman'

# Cask installations
cask 'dash'
cask 'dashlane'
cask 'divvy'
cask 'firefox'
cask 'google-chrome'
cask 'iterm2'
cask 'slack'
cask 'sublime-text3'
