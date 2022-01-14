# Custom actions to take on initial install of dotfiles.
# This runs after default install actions, so you can overwrite changes it makes if you want.

# link powerlevel10k
ln -vsfn ~/dotfiles/personal/p10k.zsh ~/.p10k.zsh

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# link nvim configuration
mkdir -p ~/.config/nvim
ln -vsfn ~/dotfiles/personal/nvim_init.vim ~/.config/nvim/init.vim

if [ "$ZSH_HOST_OS" = "darwin" ]; then
  echo "installing Homebrew packages"
  brew install --quiet neovim fzf tmux

  # link fzf configuration it references homebrew install, so won't work in ubuntu environment
  ln -vsfn ~/dotfiles/personal/fzf.zsh ~/.fzf.zsh
fi

if [ $SPIN ]; then
  sudo apt-get install fzf tmux
fi

# update submodules (ensure oh-my-tmux is loaded)
echo "updating submodules"
git submodule update --init

# link tmux configuration
ln -vsfn ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
ln -vsfn ~/dotfiles/personal/tmux.conf.local ~/.tmux.conf.local