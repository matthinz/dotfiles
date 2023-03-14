if [ ! which brew 2> /dev/null ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install "asdf"
brew install "ffmpeg"
brew install "git"
brew install "git-lfs"
brew install "go"
brew install "pandoc"
brew install "starship"
brew install "the_silver_searcher"
brew install "zsh-completions"
