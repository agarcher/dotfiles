# Setup fzf
# ---------
# Get the correct Homebrew prefix for both Intel and Apple Silicon Macs
FZF_HOMEBREW_PREFIX=$(brew --prefix)/opt/fzf

if [[ ! "$PATH" == *${FZF_HOMEBREW_PREFIX}/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${FZF_HOMEBREW_PREFIX}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_HOMEBREW_PREFIX}/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${FZF_HOMEBREW_PREFIX}/shell/key-bindings.zsh"
