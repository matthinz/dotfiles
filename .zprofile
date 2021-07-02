
# Pyenv
PYENV_ROOT="$HOME/.pyenv"
if [ -x "$PYENV_ROOT/bin/pyenv" ]; then
  export PYENV_ROOT
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi
