# Custom actions to take on initial install of dotfiles.
# This runs after default install actions, so you can overwrite changes it makes if you want.

if [ "$ZSH_HOST_OS" = "darwin" ]; then
  echo "installing Homebrew packages"
  brew install neovim
fi

ln -vsfn ~/dotfiles/personal/p10k.zsh ~/.p10k.zsh