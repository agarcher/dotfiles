# Custom actions to take on initial install of dotfiles.
# This runs after default install actions, so you can overwrite changes it makes if you want.

# link powerlevel10k
ln -vsfn ~/dotfiles/personal/p10k.zsh ~/.p10k.zsh

# link nvim configuration
mkdir -p ~/.config/nvim
ln -vsfn ~/dotfiles/personal/nvim_init.vim ~/.config/nvim/init.vim

if [ "$ZSH_HOST_OS" = "darwin" ]; then
  echo "installing Homebrew packages"
  brew install --quiet neovim
fi