# .zprofile sets the environment for login shells, including non-interactive ones.

# Homebrew path can vary based on macOS version / platform.
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:${HOME}/bin:$PATH

# asdf wants to be on $PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export GPG_TTY=$TTY

if [ -f ~/.orbstack/shell/init.zsh ]; then
  source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi

if [ -d ~/Library/Android/sdk/platform-tools ]; then
  export PATH=$PATH:~/Library/Android/sdk/platform-tools
fi
