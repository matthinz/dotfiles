#!/usr/bin/env bash

set -euo pipefail

 ffmpeg -i "$1" -an -c:v copy "${2:-cover.png}"
