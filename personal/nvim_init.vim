" ********** PLUGINS **********

call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-sensible'             " default settings
Plug 'vim-airline/vim-airline'        " status bar skin
Plug 'rakr/vim-one'                   " colorscheme / theme

call plug#end()

" *********** SETTINGS ***********

set nocompatible                    " disable compatibility to old-time vi
set showmatch                       " show matching
set ignorecase                      " case insensitive search
set hlsearch                        " highlight search
set tabstop=2                       " number of columns occupied by a tab
set softtabstop=2                   " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                       " converts tabs to white space
set shiftwidth=2                    " width for autoindents
set number                          " add line numbers
set wildmode=longest,list           " get bash-like tab completions
filetype plugin indent on           " allow auto-indenting depending on file type
syntax on                           " syntax highlighting
set mouse=a                         " enable mouse click
set clipboard^=unnamed,unnamedplus  " using system clipboard
filetype plugin on
set cursorline                      " highlight current cursorline
set ttyfast                         " Speed up scrolling in Vim
set nowrap                          " scroll horizontally rather than wrapping

" ********** KEYBINDINGS **********

:let mapleader = " "

" Clear search results
nmap <leader>/ :noh<CR>

" Vim split pane navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>_ :vsp<cr>
nnoremap <leader>- :sp<cr>
nnoremap <leader>q <c-w>q

" quick save and close
nnoremap <leader>w :w<cr>
nnoremap <leader>ww :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>qw :wq<cr>
nnoremap <leader>wq :wq<cr>

" quick close without saving
nnoremap <leader>q! :q!<cr>

" ********** THEME ************
let g:airline_theme='one'
colorscheme one
