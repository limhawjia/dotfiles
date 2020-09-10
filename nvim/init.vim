set nocompatible
let mapleader = " " 
filetype on

" Plugins
source ~/.config/nvim/plugins.vim

" Colors and themes
colorscheme nord
syntax on
set background=dark
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"

 " Ui + layout
 set number
 set relativenumber
 set colorcolumn=80
 set showmatch
 set ruler
 set laststatus=2
 set nowrap
 set cursorline

" Spell check
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad gui=undercurl guisp=#7c6f64

" Hard wrap settings
set textwidth=79
set formatoptions=tcq

" Search settings
set hlsearch
set ignorecase
set smartcase
set incsearch

" Indentation settings
filetype plugin indent on
set autoindent
set expandtab
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4 tabstop=4
set shiftround  

" Let backspace behave normally
set backspace=indent,eol,start

" Undo settings
set undolevels=1000
set undofile
set undodir=~/.local/share/nvim/undodir

" Split behavior
set splitright
set splitbelow

" Others
set noerrorbells
set nobackup
set nowritebackup
set noswapfile

" Filetype options
source ~/.config/nvim/filetypes.vim

" Keybindings
source ~/.config/nvim/keybindings.vim