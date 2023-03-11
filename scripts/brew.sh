if [ ! which brew 2> /dev/null ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

brew install "asdf"
brew install "deno"
brew install "ffmpeg"
brew install "git"
brew install "git-lfs"
brew install "go"
brew install "pandoc"
brew install "the_silver_searcher"
