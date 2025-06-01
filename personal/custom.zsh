# Define any custom environment scripts here.
# This file is loaded after everything else, but before Antigen is applied and ~/extra.zsh sourced.
# Put anything here that you want to exist on all your environment, and to have the highest priority
# over any other customization.

# Default to nvim
export EDITOR=nvim

# setup thefuck
eval $(thefuck --alias)

# load powerlevel10k prompt theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use vi mode in zsh
bindkey -v

# Aliases
alias reload="source ~/.zshrc"

# git
alias g="git"
alias gl="git pull --prune"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp="git push"
alias gd="git diff"
alias gc="git commit"
alias gca="git commit -a"
alias gam="git commit --amend"
alias gamn="git commit --amend --no-edit"
alias gco="git checkout"
alias gb="git branch"
alias gs="git status -sb"

# ls
alias l="ls -lhA --color --group-directories-first --time-style=long-iso"
alias ll="ls -lA --color"
alias lt="ls -lhAtr --color --group-directories-first --time-style=long-iso"

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

if [ "$ZSH_HOST_OS" = "darwin" ]; then
  # load fzf keybindings and completion
  [ -e ~/.fzf.zsh ] && source ~/.fzf.zsh
fi