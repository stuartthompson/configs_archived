# tmux: run on startup
#  The guard condition prevents nesting when tmux runs zsh internally
if [ "$TMUX"  = "" ]; then tmux; fi

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

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
