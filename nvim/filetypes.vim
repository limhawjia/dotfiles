augroup cpp_format
    autocmd!
    autocmd Filetype cpp setlocal cindent
    autocmd Filetype cpp setlocal cinoptions=g0
    autocmd Filetype cpp setlocal shiftwidth=2
    autocmd Filetype cpp setlocal softtabstop=2
    autocmd Filetype cpp setlocal tabstop=2
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

augroup markdown_format
    autocmd!
    autocmd Filetype markdown setlocal spelllang=en
    autocmd Filetype markdown setlocal spellfile=$HOME/.local/share/nvim/spell/en.utf-8.add
    autocmd Filetype markdown setlocal spell
    autocmd Filetype markdown setlocal conceallevel=2
augroup end

augroup text_format
    autocmd!
    autocmd Filetype text setlocal spelllang=en
    autocmd Filetype text setlocal spellfile=$HOME/.local/share/nvim/spell/en.utf-8.add
    autocmd Filetype text setlocal spell
    autocmd Filetype text setlocal conceallevel=2
augroup end

augroup yml_format
    autocmd!
    autocmd Filetype yaml setlocal shiftwidth=2
    autocmd Filetype yaml setlocal softtabstop=2
    autocmd Filetype yaml setlocal tabstop=2
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Format.nvim """"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require "format".setup {
    ["*"] = {
        {tempfile_dir = "$HOME/.local/tmp"}
    },
    go = {
        {cmd = {"gofmt -w"}}
    },
    javascript = {
        {cmd = {"prettier --write"}}
    },
    typescript = {
        {cmd = {"prettier --parser typescript --write"}}
    },
    javascriptreact = {
        {cmd = {"prettier --write"}}
    },
    typescriptreact = {
        {cmd = {"prettier --parser typescript --write"}}
    },
    css = {
        {cmd = {"prettier --parser css --write"}}
    },
    html = {
        {cmd = {"prettier --parser html --write"}}
    },
    python = {
        {cmd = {"autopep8 --in-place"}}
    },
    c = {
        {cmd = {"clang-format -i"}}
    },
    cpp = {
        {cmd = {"clang-format -i"}}
    },
}
EOF

nnoremap <leader>fa :w<Cr> :Format<Cr>
