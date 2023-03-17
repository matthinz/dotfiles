# .zshrc is evaluated for interactive shells. It is loaded
# _after_ .zprofile

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
export PATH=${HOME}/bin:$PATH

LOCAL_ZSHRC=~/.zshrc.$(uname -n)
[ -f $LOCAL_ZSHRC ] && source $LOCAL_ZSHRC

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

if type brew &> /dev/null; then
  ASDF_PREFIX=$(brew --prefix asdf 2>/dev/null)
  if [ "$ASDF_PREFIX" != "" ]; then
    . "${ASDF_PREFIX}/libexec/asdf.sh"
  fi
fi

# https://starship.rs/
which starship > /dev/null 2>&1 && eval "$(starship init zsh)"
