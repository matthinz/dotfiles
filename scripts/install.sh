#!/usr/bin/env bash

set -euo pipefail

scripts/files.sh
[ $(uname -o) == "Darwin" ] && scripts/macos.sh
[ $(uname -o) == "Darwin" ] && scripts/brew.sh
scripts/git.sh
