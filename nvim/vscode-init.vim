let mapleader = " "
filetype on

" Ui + layout
set number
set relativenumber
set colorcolumn=80
set showmatch
set ruler
set laststatus=2
set nowrap
set cursorline

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

" Split behavior
set splitright
set splitbelow

" Others
set noerrorbells
set nobackup
set nowritebackup
set noswapfile

" quicker jumps
nnoremap J 5j
nnoremap K 5k
xmap J 5j
xmap K 5k

" join next line (used to be J)
nnoremap <Leader>j J

" tab control
nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprev<CR>
nnoremap <Leader>to :tabo<CR>

" easier writes + quits
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wqa :wqa<CR>

" clear highlights
nnoremap <C-_> :noh<CR>

" open splits + navigation
nnoremap <Leader>s :sp<CR>
nnoremap <Leader>v :vsp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" fancy mappings to autoclose braces
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [<CR> [<CR>]<Esc>O

" quicker split resize
nnoremap <expr> <C-w>+ v:count1 * 5 . '<C-w>+'
nnoremap <expr> <C-w>- v:count1 * 5 . '<C-w>-'
nnoremap <expr> <C-w>< v:count1 * 5 . '<C-w><'
nnoremap <expr> <C-w>> v:count1 * 5 . '<C-w>>'
