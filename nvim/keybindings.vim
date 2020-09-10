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
nnoremap <Leader>sp :sp<CR>
nnoremap <Leader>vsp :vsp<CR>
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

" custom commands
command! BufOnly silent execute "w|%bd|e#|bd#"
