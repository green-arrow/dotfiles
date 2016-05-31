# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if which gls >/dev/null
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
end
