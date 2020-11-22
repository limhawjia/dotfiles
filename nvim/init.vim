"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Plugins """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-f> :Rg<CR>
nnoremap <C-p> :FZF<CR>

let g:closetag_filetypes='html,javascriptreact,typescriptreact'
let g:closetag_regions={
            \ 'typescriptreact': 'jsxRegion,tsxRegion',
            \ 'javascriptreact': 'jsxRegion',
            \ }

let g:polyglot_disabled=['sensible', 'autoindent']

let g:indentLine_faster=1
let g:indentLine_concealcursor='nc'
let g:indentLine_char = '⎸'

nmap cw ce
nmap cW cE

let g:pear_tree_repeatable_expand = 0

let g:undotree_HighlightChangedWithSign=0
let g:undotree_WindowLayout=4
let g:undotree_SetFocusWhenToggle=1
nnoremap <silent> <space>u :UndotreeToggle<CR>

let g:fern#disable_default_mappings=1
let g:fern#disable_drawer_smart_quit=1

noremap <silent> <C-b> :Fern . -drawer -width=35 -toggle<CR><C-w>=
noremap <silent> <C-n> :Fern . -drawer -reveal=% -width=35<CR><C-w>=

call plug#begin()
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'joshdick/onedark.vim'

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

Plug 'Yggdroot/indentLine'
Plug 'nelstrom/vim-visual-star-search'
Plug 'wellle/targets.vim'
Plug 'tommcdo/vim-lion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'chaoren/vim-wordmotion'
Plug 'mbbill/undotree'

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-git-status.vim'

Plug 'adelarsq/vim-matchit'
Plug 'alvan/vim-closetag'
Plug 'tmsvg/pear-tree'
Plug 'ap/vim-css-color'

Plug 'sheerun/vim-polyglot'

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Colors """"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on

colorscheme onehalflight
let g:airline_theme='onehalflight'

if !empty($COLORMODE) && $COLORMODE == "dark"
    colorscheme onedark
    let g:airline_theme='onehalfdark'
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" General """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

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

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Keybindings """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=' '
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <C-_> :noh<CR>

nnoremap <silent> <C-w>t :tab new<CR>
nnoremap <silent> <C-w>p :tabprevious<CR>
nnoremap <silent> <C-w>n :tabnext<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" Filetypes """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

augroup go_format
    autocmd!
    autocmd Filetype go setlocal equalprg=gofmt
augroup end

augroup cpp_format
    autocmd!
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




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""" coc """""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <C-j>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm()
            \: "<tab>"

nmap <silent> <leader>eh <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>el <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> <leader>ea  :<C-u>CocList diagnostics<cr>

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <silent><nowait> <leader>?  :<C-u>CocList commands<cr>

command! -nargs=0 Or :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Fo :call CocAction('format')

hi! CocErrorSign guifg=#d1666a
hi! CocInfoSign guibg=#353b45
hi! CocWarningSign guifg=#d1cd66



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""" Fern """""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! FernInit() abort
    nmap <buffer><expr>
                \ <Plug>(fern-my-open-expand-collapse)
                \ fern#smart#leaf(
                \   "\<Plug>(fern-action-open:select)",
                \   "\<Plug>(fern-action-expand)",
                \   "\<Plug>(fern-action-collapse)",
                \ )
    nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> m <Plug>(fern-action-mark:toggle)j
    nmap <buffer> N <Plug>(fern-action-new-file)
    nmap <buffer> K <Plug>(fern-action-new-dir)
    nmap <buffer> D <Plug>(fern-action-remove)
    nmap <buffer> M <Plug>(fern-action-move)
    nmap <buffer> R <Plug>(fern-action-rename)
    nmap <buffer> <C-s> <Plug>(fern-action-open:split)
    nmap <buffer> <C-v> <Plug>(fern-action-open:vsplit)
    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> <nowait> d <Plug>(fern-action-hidden:toggle)
    nmap <buffer> <nowait> < <Plug>(fern-action-leave)
    nmap <buffer> <nowait> > <Plug>(fern-action-enter)
    let l:indentLine_enabled=0
endfunction

augroup FernEvents
    autocmd!
    autocmd FileType fern call FernInit()
augroup END
