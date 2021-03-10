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

# Key Bindings
#
# fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# zsh-autosuggestions
bindkey '^ ' autosuggest-accept
bindkey -s '^o' 'lfcd\n'

