# .zshrc is evaluated for interactive shells. It is loaded
# _after_ .zprofile

# Preserve history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY # Write to history immediately

# Use Up + Down arrows to search history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Home + End move to beginning / end of line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'

# Git autocomplete
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

export EDITOR=vim
export PAGER=
export PATH=${HOME}/bin:${HOME}/.local/bin:$PATH

LOCAL_ZSHRC=~/.zshrc.$(uname -n)
[ -f $LOCAL_ZSHRC ] && source $LOCAL_ZSHRC

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# diff-so-fancy
if type diff-so-fancy &>/dev/null; then
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
  git config --global interactive.diffFilter "diff-so-fancy --patch"
fi

# Retain colors when piping to less
export LESS="-r"

# https://starship.rs/
which starship > /dev/null 2>&1 && eval "$(starship init zsh)"
