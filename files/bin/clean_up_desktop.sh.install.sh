#!/usr/bin/env bash

set -euo pipefail

CLEAN_UP_DESKTOP_SCRIPT="$(cd $HOME && pwd)/bin/clean_up_desktop.sh"

GREP_OUTPUT=$((crontab -l | grep "$CLEAN_UP_DESKTOP_SCRIPT") || true)


if [ -z "$GREP_OUTPUT" ]; then
  echo "Add $CLEAN_UP_DESKTOP_SCRIPT to crontab"
  echo "0 9 \* \* 1 $CLEAN_UP_DESKTOP_SCRIPT" | crontab -
fi
