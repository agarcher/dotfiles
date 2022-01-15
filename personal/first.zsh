# Sourced at the top of the .zshrc.
# Put any customizations here that need to run immediately

# set this flag to disable auto-attach
# SKIP_AUTO_ATTACH_TMUX=1
if [[ -n $SKIP_AUTO_ATTACH_TMUX ]]; then
  # noop
elif [[ "vscode" = $TERM_PROGRAM ]]; then
  folder_name="$(basename $(pwd))"
  session="code|${folder_name//\./}"
  tmux new-session -A -s $session && exit
elif [[ "tmux" = $TERM_PROGRAM ]]; then
  echo "auto attached to tmux session set SKIP_AUTO_ATTACH_TMUX to skip"
else
  session=$TERM_PROGRAM
  tmux new-session -A -s $session && exit
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi