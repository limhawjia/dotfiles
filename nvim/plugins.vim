call plug#begin()
" -- themes --
Plug 'dracula/vim', { 'as': 'dracula' }
" -- workflow --
Plug 'junegunn/fzf', { 'dir': '~/.local/lib/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
" -- editing --
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" -- vcs --
Plug 'tpope/vim-fugitive'
" -- typescript --
Plug 'HerringtonDarkholme/yats.vim'
" -- javascript --
Plug 'yuezk/vim-js'
" -- html --
Plug 'adelarsq/vim-matchit'
Plug 'alvan/vim-closetag'
" -- css --
Plug 'ap/vim-css-color'
" -- react --
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'
" -- markdown --
Plug 'plasticboy/vim-markdown'
" -- cpp --
Plug 'bfrg/vim-cpp-modern'
" -- go --
Plug 'fatih/vim-go'
" -- latex --
Plug 'conornewton/vim-latex-preview'
" -- autocompletion --
Plug 'neoclide/coc.nvim'
" -- others --
Plug 'h-youhei/vim-ibus'
call plug#end()


" plasticboy/vim-markdown "
let g:vim_markdown_folding_disabled = 1

" tpope/vim-fugitive 
nmap <Leader>gs :G<CR>

" junegunn/fzf
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
nnoremap <C-f> :Rg<CR>
nnoremap <C-p> :FZF<CR>

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*.tx,*.js'

" lervag/vimtex
let g:tex_flavor = 'latex'

" vim-ibux
let g:ibus#layout = 'xkb:us::eng'
let g:ibus#engine = 'libpinyin'

" nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
