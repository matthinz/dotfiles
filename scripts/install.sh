#!/usr/bin/env bash

set -euo pipefail

IFS=$'\n'

function install_file {
  FILE="$1"; shift
  DEST_FILE="${1:-${HOME}/${FILE}}"

if [ -f "$DEST_FILE" ]; then

    EXISTING_MD5=$(md5 -q "$DEST_FILE")
    NEW_MD5=$(md5 -q "$FILE")

    if [ "$NEW_MD5" != "$EXISTING_MD5" ]; then
      echo "Back up existing file: $DEST_FILE"
      (rm "$DEST_FILE.bak" || true) 2>&1 > /dev/null
      mv -f "$DEST_FILE" "$DEST_FILE.bak"
    else
      rm "$DEST_FILE"
    fi
fi

  mkdir -p "$(dirname "$DEST_FILE")"

  echo "$FILE -> $DEST_FILE"
  ln "$FILE" "$DEST_FILE"

  INSTALL_SCRIPT="${FILE}.install.sh"
  if [ -f "$INSTALL_SCRIPT" ]; then
    source "$INSTALL_SCRIPT" "$DEST_FILE"
  fi
}

function install_directory {
  DIR=$1; shift

  for f in $(find $DIR -type f)
  do
    install_file "$f"
  done
}

install_file .gitignore-GLOBAL "${HOME}/.gitignore"


install_file .vimrc
install_file .zprofile
install_file .zshrc
install_directory .ssh
install_directory Library

