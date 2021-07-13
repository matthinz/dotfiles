#!/usr/bin/env bash

set -euo pipefail

GLOBAL_GITIGNORE="$1"

git config --global core.excludesfile "$GLOBAL_GITIGNORE"
