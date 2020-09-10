# Basic ZSH configurations
HISTFILE=$HOME/.cache/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
setopt extendedglob
unsetopt beep extendedglob notify

# Autocompletion
zstyle :compinstall filename '/home/hawjia/.config/zsh/.zshrc'
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
alias zshconf='nvim $HOME/.config/zsh/.zshrc'
alias sxhkdre='pkill -USR1 -x sxhkd'

# FZF
export FZF_BASE=$HOME/.local/lib/fzf
export FZF_DEFAULT_COMMAND='fd --hidden -E .cache -E .git'
export FZF_CTRL_T_COMMAND='fd --hidden -E .cache -E .git'
export FZF_ALT_C_COMMAND='fd --hidden -E .cache -E .git'
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
## zsh-autosuggestions
bindkey '^@' autosuggest-accept
bindkey '^_' autosuggest-clear

# Powerlevel10k
if [[ -n $DISPLAY ]]; then
    zinit ice depth=1; zinit load romkatv/powerlevel10k
	if [[ -r "$HOME/.cache/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	  source "$HOME/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
	fi
	source ~/.config/zsh/.p10k.zsh
else
    PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
fi

# Go
export GOPATH="$HOME/Code/go"
