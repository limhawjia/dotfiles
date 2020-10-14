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
au Filetype markdown setlocal shiftwidth=2 softtabstop=2 tabstop=2

" html, js, ts, css
au bufnewfile,bufread *.jsx setlocal shiftwidth=2 softtabstop=2 tabstop=2
au bufnewfile,bufread *.tsx setlocal shiftwidth=2 softtabstop=2 tabstop=2
au bufnewfile *.jsx 0r ~/.config/nvim/templates/react.jsx
au bufnewfile *.tsx 0r ~/.config/nvim/templates/react.jsx
au Filetype html,css,javascript,typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2

" json
au Filetype json setlocal shiftwidth=2 softtabstop=2 tabstop=2
