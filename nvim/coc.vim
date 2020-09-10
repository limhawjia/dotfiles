" ui/ux settings
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
hi CocUnderline gui=undercurl term=undercurl
hi CocErrorHighlight ctermfg=red  guifg=#c4384b gui=undercurl term=undercurl
hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl
let g:airline#extensions#coc#enabled = 1

" completion keybindings
" <c-j> to toggle down suggestions
" <c-k> to toggle up suggestions
" <c-h> to trigger completion (c for help)
" <ENTER> to confirm completion
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-h> coc#refresh()
if exists('*complete_info')
  inoremap <expr> <ENTER> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <ENTER> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" navigation keybindings
" gd to goto definition
" gy to goto type definition
" gi to goto implementation
" gh to get hint
" <leader>rn to rename all occurences
" <leader>rr to open all occurences of current word in new buffer
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>rr :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)


" useful commands
" :Format format current buffer
" :Fold fold current buffer
" :OR organize imports
" command! -nargs=0 Format :call CocAction('format')
" command! -nargs=? Fold :call     CocAction('fold', <f-arg>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Diagnostics
" <leader>ea to list all errors in project
" <leader>el to goto next error in buffer
" <leader>eh to goto prev error in buffer
nmap <silent> <Leader>eh <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>el <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> <Leader>ea  :<C-u>CocList diagnostics<cr>


" highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" fixing errors
" <leader>f show fixes for selected region
" <leader>qf autofix problem on current line (qf = quickfix)
" <leader>af show fixes for entire buffer
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>f :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>j
nmap <silent> <leader>f :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@j
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>af  <Plug>(coc-codeaction)
" Show fixes below status bar instead of popup menu
" xmap <leader>f  <Plug>(coc-codeaction-selected)
" nmap <leader>f  <Plug>(coc-codeaction-selected)

" do not understand what these options do
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

