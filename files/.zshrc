# .zshrc is evaluated for interactive shells. It is loaded
# _after_ .zprofile

export EDITOR=vim
export PAGER=
export PATH=${HOME}/bin:$PATH

LOCAL_ZSHRC=~/.zshrc.$(uname -n)
[ -f $LOCAL_ZSHRC ] && source $LOCAL_ZSHRC

if which brew > /dev/null 2>&1; then
  ASDF_PREFIX=$(brew --prefix asdf 2>/dev/null)
  if [ "$ASDF_PREFIX" != "" ]; then
    . "${ASDF_PREFIX}/libexec/asdf.sh"
  fi
fi

# https://starship.rs/
which starship > /dev/null 2>&1 && eval "$(starship init zsh)"
