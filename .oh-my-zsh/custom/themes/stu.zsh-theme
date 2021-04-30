# Git status symbols
PROMPT_UNTRACKED="%{$fg_bold[red]%}u"
PROMPT_ADDED="%{$fg_bold[green]%}+"
PROMPT_DELETED="%{${bg[red]%}%{$fg_bold[white]%}x%{$reset_color%}"
PROMPT_RENAMED="%{$fg_bold[green]%}r"
PROMPT_MODIFIED="%{$fg_bold[magenta]%}m"
PROMPT_UNMERGED="%{$fg_bold[yellow]%}U"
PROMPT_STASHED="%{$fg_bold[yellow]%}s"
PROMPT_AHEAD="%{$fg_bold[white]%}>"
PROMPT_BEHIND="%{$fg_bold[white]%}<"

# Function used to determine current status
#
# Runs one git command then greps results to set status flags
function git_status() {
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | grep -E '^\?\? ' &> /dev/null); then
    STATUS="$PROMPT_UNTRACKED$STATUS"
  fi

  # Look for added files
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$PROMPT_ADDED$STATUS"
  fi

  # Look for modified files
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$PROMPT_MODIFIED$STATUS"
  fi

  # Look for renamed files
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$PROMPT_RENAMED$STATUS"
  fi

  # Look for deleted files
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$PROMPT_DELETED$STATUS"
  fi

  # Look for stashed files
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$PROMPT_STASHED$STATUS"
  fi

  # Look for unmerged files
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$PROMPT_UNMERGED$STATUS"
  fi

  # Check if we're ahead of the remote
  if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
    STATUS="$PROMPT_AHEAD$STATUS"
  fi

  # Check if we're behind the remote
  if $(echo "$INDEX" | grep '^## .*behind' &> /dev/null); then
    STATUS="$PROMPT_BEHIND$STATUS"
  fi

  # Only output status if at least one state was found
  if [[ ! -z $STATUS ]]; then
    echo "%{$fg[cyan]%}]%{$fg[green]%}-%{$fg[cyan]%}[$STATUS%{$reset_color%}"
  fi
}

# Prints git info
function git_info() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "%{$fg[cyan]%}[%{$fg_bold[yellow]%}${ref#refs/heads/}%{$reset_color%}%{$fg[red]%} $(git_prompt_short_sha)$(git_status)%{$fg[cyan]%}]%{$fg[green]%}-"
  fi
}

# Set the prompt
#
# ┌[working directory]-[git info]-[user@machine]
# └> 
PROMPT=$'
%{$fg[green]%}┌%{$fg[cyan]%}[%{$fg[yellow]%}%~%{$fg[cyan]%}]%{$fg[green]%}-$(git_info)%{$fg[cyan]%}[%{$fg_bold[blue]%}%n%{$reset_color%}%{$fg[white]%}@%{$fg_bold[blue]%}%m%{$reset_color%}%{$fg[cyan]%}]
%{$fg[green]%}└%{$fg_bold[green]%}> %{$reset_color%}'



