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
au Filetype go set equalprg=gofmt

" latex
au Filetype tex set conceallevel=2

" markdown
au Filetype markdown set conceallevel=2
au Filetype markdown set shiftwidth=2
au Filetype markdown set softtabstop=2 tabstop=2

" html, js, ts, css
au Filetype html,css,javascript,typescript set shiftwidth=2
au Filetype html,css,javascript,typescript set softtabstop=2 tabstop=2
