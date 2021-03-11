# tmux: run on startup
#  The guard condition prevents nesting when tmux runs zsh internally
if [ "$TMUX"  == "" ]; then tmux; fi

# Path to your oh-my-zsh installation.
export ZSH="/home/stu/.oh-my-zsh"

# Theme
ZSH_THEME="stu"

# Plugins
plugins=(
	git
	fzf
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

# Keychain
/usr/bin/keychain -q --nogui $HOME/.ssh/github
source $HOME/.keychain/$HOST-sh

# Plugin Configurations

## zsh-autosuggestions
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#444444'
