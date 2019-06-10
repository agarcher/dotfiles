# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# edit current command in vim with <esc>v
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
