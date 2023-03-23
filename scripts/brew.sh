if [ ! which brew 2> /dev/null ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

function brew_install {
  PACKAGE=$1; shift
  if brew list $PACKAGE > /dev/null 2>&1; then
    echo "$PACKAGE is already installed."
  else
    brew install $PACKGE
  fi
}

brew_install asdf
brew_install ffmpeg
brew_install git
brew_install git-lfs
brew_install go
brew_install pandoc
brew_install starship
brew_install the_silver_searcher
brew_install zsh-completions
