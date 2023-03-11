#!/usr/bin/env bash

set -euo pipefail

ffmpeg -i "$1" -c copy .tmp.m4a
mv .tmp.m4a "$1"
