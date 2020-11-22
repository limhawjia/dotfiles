# Basic ZSH configurations
HISTFILE=$HOME/.cache/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
setopt extendedglob
unsetopt beep extendedglob notify

# Autocompletion
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
zstyle ':completion:*' menu yes select
zmodload zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
autoload -Uz compinit
compinit

# Vi mode
set -o vi
bindkey -v

# Environment variables
export SHELL='/bin/zsh'
export EDITOR='nvim'

# PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Code/go/bin"

# Aliases
alias ls='LC_COLLATE=C ls --color=auto'
alias la='LC_COLLATE=C ls -a --color=auto'
alias ll='LC_COLLATE=C ls -la --color=auto'
alias zshconf='vim $HOME/.config/zsh/.zshrc'
alias sxhkdre='pkill -USR1 -x sxhkd'
alias vim='nvim'
alias vimconf='vim $HOME/.config/nvim/init.vim'
alias switchcolors='source $HOME/.local/scripts/alacritty-theme-switcher.sh'

# Default color
switchcolors dark

# FZF
export FZF_BASE=$HOME/.local/lib/fzf
export FZF_DEFAULT_COMMAND='fdfind --hidden -E .cache -E .git'
export FZF_CTRL_T_COMMAND='fdfind --hidden -E .cache -E .git'
export FZF_ALT_C_COMMAND='fdfind --hidden -E .cache -E .git'
DISABLE_FZF_AUTO_COMPLETION="false"
DISABLE_FZF_KEY_BINDINGS="false"

# Plugins
source $HOME/.local/lib/zinit/zinit.zsh
OMZ="https://github.com/ohmyzsh/ohmyzsh/blob/master"
zinit load zsh-users/zsh-syntax-highlighting
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-completions
zinit snippet "$OMZ/plugins/fzf/fzf.plugin.zsh"
zinit snippet "$OMZ/plugins/colored-man-pages/colored-man-pages.plugin.zsh"
zinit snippet "$OMZ/plugins/vi-mode/vi-mode.plugin.zsh"
zinit snippet "$OMZ/plugins/golang/golang.plugin.zsh"
zinit snippet "$OMZ/lib/termsupport.zsh"
zinit light denysdovhan/spaceship-prompt
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false

## zsh-autosuggestions
bindkey '^@' autosuggest-accept
bindkey '^_' autosuggest-clear
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# Go
export GOPATH="$HOME/Code/go"

# TERM
export TERM=xterm-256color
