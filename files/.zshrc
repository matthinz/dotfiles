# .zshrc is evaluated for interactive shells. It is loaded
# _after_ .zprofile

export EDITOR=vim
export PAGER=
export PATH=${HOME}/bin:$PATH

LOCAL_ZSHRC=~/.zshrc.$(uname -n)
[ -f $LOCAL_ZSHRC ] && source $LOCAL_ZSHRC

# https://starship.rs/
which starship > /dev/null 2>&1 && eval "$(starship init zsh)"
