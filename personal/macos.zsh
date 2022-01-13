# Custom configs for MacOS environments.
# This file will only be executed if the current environment is MacOS.

# Slightly slower keyboard repeat rate than the default of the opinionated base repo
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# enable key repeat in vscode vim mode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium

# Stuff for dev
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh