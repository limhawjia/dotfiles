" nvim lsp setup
lua <<EOF
local nvim_lsp = require 'nvim_lsp'

local on_attach_vim = function(client)
require'completion'.on_attach(client)
require'diagnostic'.on_attach(client)
end

nvim_lsp.gopls.setup{on_attach=on_attach_vim}
nvim_lsp.clangd.setup{on_attach=on_attach_vim}
nvim_lsp.pyls.setup{on_attach=on_attach_vim}
nvim_lsp.tsserver.setup{on_attach=on_attach_vim}
nvim_lsp.bashls.setup{on_attach=on_attach_vim}
nvim_lsp.texlab.setup{on_attach=on_attach_vim}
nvim_lsp.cssls.setup{on_attach=on_attach_vim}
EOF

" golang
au Filetype go setlocal equalprg=gofmt

" latex
au Filetype tex setlocal conceallevel=2

" markdown
au Filetype markdown setlocal conceallevel=2
au Filetype markdown setlocal shiftwidth=2
au Filetype markdown setlocal softtabstop=2 tabstop=2

" html, js, ts, css
au Filetype html,css,javascript,typescript setlocal shiftwidth=2
au Filetype html,css,javascript,typescript setlocal softtabstop=2 tabstop=2

" jsx, tsx
au Filetype *.tsx,*.jsx setlocal shiftwidth=2
au Filetype *.tsx,*.jsx setlocal softtabstop=2 tabstop=2
