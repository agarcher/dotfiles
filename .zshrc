# This script is run every time you log in. It's the entrypoint for all shell environment config.
# Don't modify this file directly, or you'll remove your ability to update against new versions of
# the dotfiles-starter-template

export DF_HOME=~/dotfiles
export DF_CORE=$DF_HOME/core
export DF_USER=$DF_HOME/personal

# Customization script that runs first and takes precidence
# Should be easy to merge with future updates
if [ -e $DF_USER/first.zsh ]; then
  source $DF_USER/first.zsh
fi

# Create common color functions.
autoload -U colors
colors

# Include the default Spin zshrc
# This file has a number of useful functions for detecting the status of the Spin environment.
# We can still overwrite the terminal display later on, if we want.
if [ $SPIN ]; then
  if [ -e /etc/zsh/zshrc.default.inc.zsh ]; then
    source /etc/zsh/zshrc.default.inc.zsh
  fi
fi

# Set up custom environment variables
source $DF_CORE/environment.zsh
source $DF_USER/environment.zsh

# Load color helper variable definitions
source $DF_CORE/formatting.zsh

# Load configs for MacOS. Does nothing if not on MacOS
if [ "$ZSH_HOST_OS" = "darwin" ]; then
  source $DF_CORE/macos.zsh
  if [ -e $DF_USER/macos.zsh ]; then
    source $DF_USER/macos.zsh
  fi
fi

# Load zsh plugins via Antigen
source $DF_CORE/default_bundles.zsh
source $DF_USER/antigen_bundles.zsh
antigen apply

source $DF_CORE/utils.zsh

# Load custom dircolors, if present
if [ -e $DF_USER/dircolors ]; then
  eval $(dircolors $DF_USER/dircolors)
fi

source $DF_CORE/filter_history.zsh

# Load personalized configs for Spin environments
source $DF_USER/spin.zsh

source $DF_USER/custom.zsh

# Load changes specific to this local environment.
source ~/extra.zsh

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/Users/agarcher/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/agarcher/Downloads/google-cloud-sdk 2/path.zsh.inc' ]; then . '/Users/agarcher/Downloads/google-cloud-sdk 2/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/agarcher/Downloads/google-cloud-sdk 2/completion.zsh.inc' ]; then . '/Users/agarcher/Downloads/google-cloud-sdk 2/completion.zsh.inc'; fi

# Added by Windsurf
export PATH="/Users/agarcher/.codeium/windsurf/bin:$PATH"
