#!/usr/bin/env bash

set -euo pipefail

PLIST_FILE="$1"

if [[ ! -f "$PLIST_FILE" ]]; then
  echo "Error: File '$PLIST_FILE' does not exist."
  exit 1
fi

defaults import com.apple.Terminal "$PLIST_FILE"
