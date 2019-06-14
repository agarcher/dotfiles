" ********** PLUGINS **********

" Auto install plug.vim plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'                           " default settings
Plug 'altercation/vim-colors-solarized'             " colour scheme
Plug '/usr/local/opt/fzf'                           " fuzzy file search
Plug 'junegunn/fzf.vim'                             " fuzzy file search
Plug 'christoomey/vim-tmux-navigator'               " tmux/vim pane management
Plug 'scrooloose/nerdtree'                          " file browser
Plug 'mileszs/ack.vim'                              " file search utility
Plug 'scrooloose/nerdcommenter'                     " hotkey code commenting
Plug 'luochen1990/rainbow'                          " parenthesis colour coding
Plug 'itchyny/lightline.vim'                        " status bar skin
" Plug 'vim-airline/vim-airline'                      " status bar skin
Plug 'vim-ruby/vim-ruby'                            " ruby things
call plug#end()

" ********** SETTINGS **********

" Source vimrc when it is modified
autocmd bufwritepost .vimrc source $MYVIMRC

" Highlight search results
set hlsearch

" Line numbers
set number

" Color scheme config
syntax enable
set background=dark
colorscheme solarized

" Fuzzy file search config
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Mac Vim settings
set guifont=Menlo:h15

" Use ag for ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Activate rainbow parenthesis
let g:rainbow_active = 1

"default indent settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent

" Don't wrap or insert new lines
set nowrap
set textwidth=0 wrapmargin=0

" ********** KEYBINDINGS **********

:let mapleader = " "

" Clear search results
nmap <leader>/ :noh<CR>

" Fuzzy file search in working directory
nnoremap <C-P> :FZF<CR>
nnoremap <Leader><space> :FZF<CR>

" Vim split pane navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>_ :vsp<cr>
nnoremap <leader>- :sp<cr>
nnoremap <leader>q <c-w>q

" Open nerd tree
map <C-n> :NERDTreeToggle<CR>

" Find in files
nnoremap <leader>f :Ack

" quick save and close
nnoremap <leader>w :w<cr>
nnoremap <leader>ww :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>qw :wq<cr>
nnoremap <leader>wq :wq<cr>

" quick close without saving
nnoremap <leader>q! :q!<cr>
