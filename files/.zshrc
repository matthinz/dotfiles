# .zshrc is evaluated for interactive shells. It is loaded
# _after_ .zprofile

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

export EDITOR=vim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git nvm)

source $ZSH/oh-my-zsh.sh

if which pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
