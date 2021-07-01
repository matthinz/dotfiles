PATH=$PATH:$HOME/.local/bin

# Python USER_BASE support
if which python3 > /dev/null 2>&1; then
  PATH=$PATH:$(python3 -m site --user-base)/bin
fi

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
