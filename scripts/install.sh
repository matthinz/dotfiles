#!/usr/bin/env bash

set -euo pipefail

FILES_DIR=files
INSTALLER_SUFFIX=.install.sh

IFS=$'\n'

function install_file {
  FILE="$1"; shift
  SOURCE_FILE="${FILES_DIR}/${FILE}"
  DEST_FILE="${HOME}/${FILE}"

  if [ -f "$DEST_FILE" ]; then

    EXISTING_MD5=$(md5 -q "$DEST_FILE")
    NEW_MD5=$(md5 -q "$SOURCE_FILE")

    if [ "$NEW_MD5" != "$EXISTING_MD5" ]; then
      echo "Back up existing file: $DEST_FILE"
      (rm "$DEST_FILE.bak" || true) 2>&1 > /dev/null
      mv -f "$DEST_FILE" "$DEST_FILE.bak"
    else
      rm "$DEST_FILE"
    fi
  fi

  mkdir -p "$(dirname "$DEST_FILE")"

  echo "$SOURCE_FILE -> $DEST_FILE"
  ln "$SOURCE_FILE" "$DEST_FILE"

  INSTALL_SCRIPT="${FILE}${INSTALLER_SUFFIX}"
  if test -f "$INSTALL_SCRIPT"; then
    source "$INSTALL_SCRIPT" "$DEST_FILE"
  fi
}


for f in $(find $FILES_DIR -type f | sed "s#^${FILES_DIR}/##")
do
  if [[ "$f" == *.install.sh ]]; then
    # This is an installer. Ignore.
    continue
  fi

  install_file "$f"
done

scripts/macos.sh
scripts/brew.sh
scripts/git.sh
