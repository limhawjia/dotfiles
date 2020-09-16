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

" custom commands
command! BufOnly silent execute "w|%bd|e#|bd#"

" nvim-lsp + completion-nvim + diagnostics-nvim
nnoremap <silent> <Leader>gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>gs    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <Leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <Leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <Leader>qf    <cmd>lua vim.lsp.buf.code_action()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
imap <expr> <C-space>  pumvisible() ? complete_info()["selected"] != "-1" ?
                \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

nnoremap <silent> <Leader>eh :PrevDiagnosticCycle<CR>
nnoremap <silent> <Leader>el :NextDiagnosticCycle<CR>
nnoremap <silent> <Leader>ea :OpenDiagnostic<CR>
