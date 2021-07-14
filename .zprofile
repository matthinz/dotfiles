# .zprofile sets the environment for login shells, including non-interactive ones.

export PATH=$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# Pyenv
PYENV_ROOT="$HOME/.pyenv"
if [ -x "$PYENV_ROOT/bin/pyenv" ]; then
  export PYENV_ROOT
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi
