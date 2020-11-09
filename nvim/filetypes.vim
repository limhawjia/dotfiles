" markdown
au Filetype cpp setlocal conceallevel=2
au Filetype cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2
au Filetype cpp setlocal equalprg=clang-format

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

" yml
au Filetype yml setlocal shiftwidth=2 softtabstop=2 tabstop=2
