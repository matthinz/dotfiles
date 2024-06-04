# .zprofile sets the environment for login shells, including non-interactive ones.

# Homebrew path can vary based on macOS version / platform.
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH

export GPG_TTY=$TTY

if type brew &> /dev/null; then
  ASDF_PREFIX=$(brew --prefix asdf 2>/dev/null)
  if [ "$ASDF_PREFIX" != "" ]; then
    . "${ASDF_PREFIX}/libexec/asdf.sh"
  fi
fi
