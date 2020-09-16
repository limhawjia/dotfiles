call plug#begin()
" -- themes --
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" -- syntax --
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" ui layout
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
" -- workflow --
Plug 'junegunn/fzf', { 'dir': '~/.local/lib/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'conornewton/vim-latex-preview'
" -- editing --
Plug 'adelarsq/vim-matchit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'dhruvasagar/vim-table-mode'
" -- vcs --
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" -- languages --
Plug 'fatih/vim-go'
" -- autocompletion --
Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/completion-nvim'
" -- others --
Plug 'h-youhei/vim-ibus'
call plug#end()

" gruvbox-community/gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

" junegunn/rainbow_parentheses.vim
au VimEnter * RainbowParentheses "always on

" Yggdroot/indentLine
let g:indentLine_setConceal = 2
" default ''.
" n for Normal mode
" v for Visual mode
" i for Insert mode
" c for Command line editing, for 'incsearch'
let g:indentLine_concealcursor = ""

" plasticboy/vim-markdown "
let g:vim_markdown_folding_disabled = 1

" vim-python/python-syntax
let g:python_highlight_all = 1 "enable all features
"
" vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_spell=0
let g:airline_skip_empty_sections = 1
"
" tpope/vim-fugitive 
nmap <Leader>gs :G<CR> "<Leader>gs to open up git status page>

" preservim/nerdtree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1 
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMapOpenInTab='<C-t>'
let g:NERDTreeMapOpenSplit='<C-s>'
let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeIgnore=['\~$', '^__pycache__$', '^node_modules$', '^.git$']
let g:NERDTreeBookmarksFile = '/home/hawjiaa/.config/nvim/NERDTreeBookmarks'
map <C-b> :NERDTreeToggle<Cr>
map <C-n> :NERDTreeFind<CR>

" junegunn/fzf
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
nnoremap <C-f> :Rg<CR>

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*.tx,*.js'

" lervag/vimtex
let g:tex_flavor = 'latex'

" vim-ibux
let g:ibus#layout = 'xkb:us::eng'
let g:ibus#engine = 'libpinyin'

" nvim-lsp + completion-nvim + diagnostic-nvim
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_confirm_key = ""
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_trimmed_virtual_text = '20'
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_enable_underline = 1

