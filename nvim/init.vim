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

set scrolloff=5

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

" plugin to show indentation
let g:indentLine_faster=1
let g:indentLine_concealcursor='c'
let g:indentLine_char = '⎸'

" self-explanatory
let g:undotree_WindowLayout=4
let g:undotree_SetFocusWhenToggle=1
cnoreabbrev un UndotreeToggle

" plugin to autoclose tags
let g:closetag_filetypes='html,javascriptreact,typescriptreact'
let g:closetag_regions={
            \ 'typescriptreact': 'jsxRegion,tsxRegion',
            \ 'javascriptreact': 'jsxRegion',
            \ }

" essential for nvim-compe
set completeopt=menu,menuone,noselect

call plug#begin()

" nvim essentials dependencies
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" nvim essentials
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

" colorscheme
Plug 'joshdick/onedark.vim'

" tpope essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" quality of life
Plug 'Yggdroot/indentLine'
Plug 'nelstrom/vim-visual-star-search'
Plug 'wellle/targets.vim'
Plug 'tommcdo/vim-lion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mbbill/undotree'
Plug 'andymass/vim-matchup'
Plug 'ap/vim-css-color'

" xml/html lifesavers
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Colors """"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme onedark

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" Filetypes """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup go_format
    autocmd!
    autocmd Filetype go setlocal equalprg=gofmt
augroup end

augroup cpp_format
    autocmd!
    autocmd Filetype cpp setlocal cindent
    autocmd Filetype cpp setlocal cinoptions=g0
    autocmd Filetype cpp setlocal shiftwidth=2
    autocmd Filetype cpp setlocal softtabstop=2
    autocmd Filetype cpp setlocal tabstop=2
    autocmd Filetype cpp setlocal equalprg=clang-format
augroup end

augroup web_format
    autocmd!
    autocmd Filetype html setlocal shiftwidth=2
    autocmd Filetype html setlocal softtabstop=2
    autocmd Filetype html setlocal tabstop=2
    autocmd Filetype html setlocal equalprg=prettier\ --parser\ html

    autocmd Filetype css setlocal shiftwidth=2
    autocmd Filetype css setlocal softtabstop=2
    autocmd Filetype css setlocal tabstop=2
    autocmd Filetype css setlocal equalprg=prettier\ --parser\ css

    autocmd Filetype javascript setlocal shiftwidth=2
    autocmd Filetype javascript setlocal softtabstop=2
    autocmd Filetype javascript setlocal tabstop=2
    autocmd Filetype javascript setlocal equalprg=prettier

    autocmd Filetype typescript setlocal shiftwidth=2
    autocmd Filetype typescript setlocal softtabstop=2
    autocmd Filetype typescript setlocal tabstop=2
    autocmd Filetype typescript setlocal equalprg=prettier\ --parser\ typescript

    autocmd bufnewfile,bufread *.jsx setlocal filetype=javascriptreact
    autocmd bufnewfile, bufread *.tsx setlocal filetype=typescriptreact

    autocmd Filetype javascriptreact setlocal shiftwidth=2
    autocmd Filetype javascriptreact setlocal softtabstop=2
    autocmd Filetype javascriptreact setlocal tabstop=2
    autocmd Filetype javascriptreact setlocal equalprg=prettier

    autocmd Filetype typescriptreact setlocal shiftwidth=2
    autocmd Filetype typescriptreact setlocal softtabstop=2
    autocmd Filetype typescriptreact setlocal tabstop=2
    autocmd Filetype typescriptreact setlocal equalprg=prettier\ --parser\ typescript
augroup end

augroup sql_format
    autocmd!
    autocmd Filetype sql setlocal shiftwidth=2
    autocmd Filetype sql setlocal softtabstop=2
    autocmd Filetype sql setlocal tabstop=2
augroup end

augroup json_format
    autocmd!
    autocmd Filetype json setlocal shiftwidth=2
    autocmd Filetype json setlocal softtabstop=2
    autocmd Filetype json setlocal tabstop=2
augroup end

augroup python_format
    autocmd!
    autocmd Filetype python setlocal equalprg=autopep8\ -
augroup end

augroup markdown_format
    autocmd!
    autocmd Filetype markdown setlocal spelllang=en
    autocmd Filetype markdown setlocal spellfile=$HOME/.local/share/nvim/spell/en.utf-8.add
    autocmd Filetype markdown setlocal spell
    autocmd Filetype markdown setlocal conceallevel=2
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" builtin-lsp """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> el <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> eh <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ea <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" lspconfig """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require 'lspconfig'.bashls.setup{}
require 'lspconfig'.clangd.setup{}
require 'lspconfig'.cmake.setup{}
require 'lspconfig'.cssls.setup{}
require 'lspconfig'.dockerls.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require 'lspconfig'.pyright.setup{}
require 'lspconfig'.sqlls.setup{}
require 'lspconfig'.texlab.setup{}
require 'lspconfig'.tsserver.setup{}
require 'lspconfig'.vimls.setup{}
require 'lspconfig'.vuels.setup{}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" nvim-compe """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
EOF

inoremap <silent><expr> <C-space> compe#complete()
inoremap <silent><expr> <Tab> compe#confirm('<Tab>')
inoremap <silent><expr> <CR> compe#confirm('<CR>')

lua <<EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.c_j_next = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  else
    return t "<C-j>"
  end
end
_G.c_k_prev = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<C-k>"
  end
end

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.c_j_next()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.c_j_next()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.c_k_prev()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.c_k_prev()", {expr = true})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Treesitter """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  }
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" Devicons """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require'nvim-web-devicons'.setup {
    default = true;
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Telescope """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-m> <cmd>Telescope buffers<cr>

lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = false,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-p>"] = false,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-x>"] = false,
                ["<C-s>"] = actions.goto_file_selection_split
            }
        }
    }
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Galaxyline """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

luafile $HOME/.config/nvim/evilline.lua

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" nvim-tree """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:nvim_tree_ignore=['.git']
let g:nvim_tree_auto_open=1
let g:nvim_tree_auto_close=1
let g:nvim_tree_git_hl=1
let g:nvim_tree_show_icons={
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1
    \ }
let g:nvim_tree_bindings = {
    \ 'edit':            ['<CR>', 'o'],
    \ 'edit_vsplit':     '<C-v>',
    \ 'edit_split':      '<C-s>',
    \ 'edit_tab':        '<C-t>',
    \ 'close_node':      ['<S-CR>', '<BS>'],
    \ 'toggle_ignored':  'I',
    \ 'toggle_dotfiles': 'H',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              '<C-]>',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'c',
    \ 'paste':           'p',
    \ 'prev_git_item':   '[c',
    \ 'next_git_item':   ']c',
    \ 'dir_up':          '-',
    \ 'close':           'q',
    \ }
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>

