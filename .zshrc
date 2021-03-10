# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/stu/.oh-my-zsh"

# Theme
ZSH_THEME="stu"

# Plugins
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# Aliases
alias colortest="~/.config/zsh/functions/colortest"

# SSH Agent
{ eval $(ssh-agent); ssh-add ~/.ssh/github } &>/dev/null

# Plugin Configurations

## fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

## zsh-autosuggestions
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#444444'
