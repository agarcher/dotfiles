# Sourced at the top of the .zshrc.
# Put any customizations here that need to run immediately

# set this flag to disable auto-attach
# SKIP_AUTO_ATTACH_TMUX=1
if [[ -n $SKIP_AUTO_ATTACH_TMUX || -n $SSH_CONNECTION ]]; then
  # noop
elif [[ "vscode" = $TERM_PROGRAM ]]; then
  folder_name="$(basename $(pwd))"
  session="code|${folder_name//\./}"
  tmux new-session -A -s $session && exit
elif [[ "tmux" = $TERM_PROGRAM ]]; then
  # already inside a tmux session, nothing to attach
elif command -v fzf >/dev/null 2>&1; then
  # Interactive tmux session manager (iTerm, Terminal, etc).
  # Pick an existing session, create a new named one, or open a plain shell.
  # Make sure the always-available "default" session exists.
  tmux has-session -t default 2>/dev/null || tmux new-session -d -s default

  # Command that renders the menu: existing sessions + a "create new" entry.
  __tmux_menu='tmux list-sessions -F "#{session_name}" 2>/dev/null; printf "[+] new session\n"'
  # ctrl-x kills the highlighted session and refreshes the list.
  __tmux_kill='ctrl-x:execute-silent(tmux kill-session -t {} 2>/dev/null)+reload('"$__tmux_menu"')'

  __tmux_pick=$(eval "$__tmux_menu" | fzf \
    --height='~40%' --reverse --no-multi \
    --prompt='tmux session ❯ ' \
    --header='enter: attach   ctrl-x: kill session   esc: plain shell' \
    --bind "$__tmux_kill")

  if [[ "$__tmux_pick" == "[+] new session" ]]; then
    read "__tmux_name?new session name: "
    __tmux_name=${__tmux_name//[.: ]/-}  # tmux disallows '.' and ':' in names
    [[ -n "$__tmux_name" ]] && { tmux new-session -A -s "$__tmux_name" && exit }
  elif [[ -n "$__tmux_pick" ]]; then
    tmux new-session -A -s "$__tmux_pick" && exit
  fi
  unset __tmux_menu __tmux_kill __tmux_pick __tmux_name
else
  # fzf unavailable: fall back to the old single auto-attached session.
  session=$TERM_PROGRAM
  tmux new-session -A -s $session && exit
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi