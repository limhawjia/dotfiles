###############################################################################
################################ Basics #######################################
###############################################################################

# history settings
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# use vi keybindings
set -o vi
bindkey -v

# init completion system
autoload -Uz compinit
compinit

# allow completers to show more information about the matches
zstyle ':completion:*' auto-description 'specify: %d'
# order of styles of completion to be used by completers
zstyle ':completion:*' completer _expand _complete _correct _approximate
# find out where the completions are from
zstyle ':completion:*' format 'Completing %d...'
# determines how listings are grouped
zstyle ':completion:*' group-name ''
# use a selection menu
zstyle ':completion:*' menu yes select
zmodload -i zsh/complist

# same same bindings for navigation
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '' send-break

# enable colors in select menu
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
# prompts for select menus
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
# special colors for kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

###############################################################################
############################### Varibles ######################################
###############################################################################

# Environment variables
export SHELL='/bin/zsh'
export EDITOR='nvim'
export GOPATH="$HOME/Code/go"
export TERM=xterm-256color

# PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Code/go/bin"
export PATH="$PATH:/usr/local/go/bin"

# Aliases
alias ls='LC_COLLATE=C ls --color=auto'
alias la='LC_COLLATE=C ls -a --color=auto'
alias ll='LC_COLLATE=C ls -la --color=auto'

###############################################################################
################################ Zinit ########################################
###############################################################################

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

###############################################################################
################################ Plugins ######################################
###############################################################################

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
PURE_PROMPT_SYMBOL=➜

OMZ="https://github.com/ohmyzsh/ohmyzsh/blob/master"
zinit load zsh-users/zsh-completions
zinit load zsh-users/zsh-syntax-highlighting
zinit snippet "$OMZ/plugins/colored-man-pages/colored-man-pages.plugin.zsh"
zinit snippet "$OMZ/lib/termsupport.zsh"

###############################################################################
################################ Others #######################################
###############################################################################

# FZF keybindings
source /usr/share/doc/fzf/examples/key-bindings.zsh
bindkey '^F' fzf-file-widget
