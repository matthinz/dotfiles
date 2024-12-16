#!/usr/bin/env bash

set -euo pipefail

ARCHIVE_FOLDER="$HOME/Desktop/__ARCHIVE__"
FOLDER_TO_SCAN=$(dirname "$ARCHIVE_FOLDER")

mkdir -p "$ARCHIVE_FOLDER"  > /dev/null 2>&1
xattr -w com.apple.metadata:_kMDItemUserTags "(Gray)" "$ARCHIVE_FOLDER" > /dev/null 2>&1

FILES_TO_ARCHIVE=$(find "$FOLDER_TO_SCAN" -maxdepth 1 -ctime +3 -exec sh -c 'xattr -p com.apple.metadata:_kMDItemUserTags "$1" >/dev/null 2>&1 || echo "$1"' sh {} \;)

if [ -z "$FILES_TO_ARCHIVE" ]; then
  FILE_COUNT=0
else
  FILE_COUNT=$(echo "$FILES_TO_ARCHIVE" | wc -l | awk '{$1=$1; print}')
fi

if [ "$FILE_COUNT" -eq 0 ]; then
  echo "No files to archive" >&2
  exit
fi

NOW=$(date +"%Y-%m-%d %H%M%S")

TOTAL_SIZE=$(echo "$FILES_TO_ARCHIVE" | tr '\n' '\0' | xargs -0 du -ch | tail -n 1 | awk '{print $1}')

FOLDER_FOR_NOW="${ARCHIVE_FOLDER}/${NOW} (${FILE_COUNT} items, ${TOTAL_SIZE})"

if [ "${DRY_RUN:-}" == "1" ]; then
  echo "Would archive ${FILE_COUNT} items to '${FOLDER_FOR_NOW}'"
  exit
fi

mkdir -p "${FOLDER_FOR_NOW}" > /dev/null 2>&1

if [ "$FILES_TO_ARCHIVE" == "" ]; then
	exit
fi

while IFS= read -r f
do
	mv "${f}" "${FOLDER_FOR_NOW}/$(basename "${f}")"
done  <<< "$FILES_TO_ARCHIVE"
