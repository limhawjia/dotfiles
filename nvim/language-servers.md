# Language Servers

Neovim's built-in lsp requires you to install the lsp yourself. Integration  and
configuration can be simplified and automated using `nvim-lspconfig`.

## Language servers of interest

### bashls

`sudo npm i -g bash-language-server`

### clangd

`sudo apt-get install clangd-9`

Note that the binary will be saved as `clangd-9`. Use update-alternatives to
to link `clangd` to `clangd-9`.

### cmake

`pip install cmake-language-server`

### cssls

`sudo npm i -g vscode-css-languageserver-bin`

### dockerls

`sudo npm i -g dockerfile-language-server-nodejs`

### html

`sudo npm i -g vscode-html-languageserver-bin`

### pyright

`sudo npm i -g pyright`

### sqlls

`sudo npm i -g sql-language-server`

### texlab

Texlab is not avaiable on any package manager. Thus, the binary has to be
downloaded or built manually.

### tsserver

`sudo npm i -g typescript typescript-language-server`

### vimls

`sudo npm i -g vim-language-server`

### vuels

`sudo npm i -g vls`

