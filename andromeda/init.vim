"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" General """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin indent on

syntax enable

set number
set relativenumber
set colorcolumn=80
set nowrap

set textwidth=80
set formatoptions=tcq

set ignorecase
set smartcase
set incsearch

set autoindent
set expandtab
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround

set backspace=indent,eol,start
set undolevels=1000
set undofile
set undodir=~/.local/share/nvim/undodir

set noerrorbells
set nobackup
set nowritebackup
set noswapfile

set splitright
set splitbelow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Plugins """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

Plug 'Yilin-Yang/vim-markbar'
Plug 'junegunn/vim-peekaboo'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Colors """"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme nord

highlight RedundantSpaces guibg=#e06c75
match RedundantSpaces /\s\+$\|\t/

augroup Background
    autocmd!
    autocmd vimenter * hi Normal  guibg=None ctermbg=None
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Keybindings """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=' '

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <C-_> :noh<CR>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k

inoremap {<cr> {<cr>}<esc>O
inoremap (<cr> (<cr>)<esc>O

cnoreabbrev <silent> trim %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Neovim lsp """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF

" keybindings for lsp commands
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>

" keybindings for navigating diagnostics
nnoremap <silent> <leader>el <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>eh <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>ea <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

" settings for completion-nvim
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Treesitter """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" Plugin options """"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" codefmt
augroup autoformat_settings
  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType typescript AutoFormatBuffer prettier
augroup END

nnoremap <silent> <leader>fo :FormatCode<CR>

" telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>? <cmd>Telescope help_tags<cr>

lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<c-[>"] = actions.close,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-u>"] = actions.preview_scrolling_up,
        ["<c-d>"] = actions.preview_scrolling_down,
      }
    },
  }
}
EOF

" vim-closetag
let g:closetag_filetypes='html,javascriptreact,typescriptreact'
let g:closetag_regions={
            \ 'typescriptreact': 'jsxRegion,tsxRegion',
            \ 'javascriptreact': 'jsxRegion',
            \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" Filetype options """""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup web
    autocmd!
    autocmd Filetype html setlocal shiftwidth=2
    autocmd Filetype html setlocal softtabstop=2
    autocmd Filetype html setlocal tabstop=2

    autocmd Filetype css setlocal shiftwidth=2
    autocmd Filetype css setlocal softtabstop=2
    autocmd Filetype css setlocal tabstop=2

    autocmd Filetype javascript setlocal shiftwidth=2
    autocmd Filetype javascript setlocal softtabstop=2
    autocmd Filetype javascript setlocal tabstop=2

    autocmd Filetype typescript setlocal shiftwidth=2
    autocmd Filetype typescript setlocal softtabstop=2
    autocmd Filetype typescript setlocal tabstop=2
augroup end
