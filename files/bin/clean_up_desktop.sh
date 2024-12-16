#!/usr/bin/env bash

set -euo pipefail

ARCHIVE_FOLDER="$HOME/Desktop/__ARCHIVE__"
FOLDER_TO_SCAN=$(dirname "$ARCHIVE_FOLDER")

mkdir -p "$ARCHIVE_FOLDER"  > /dev/null 2>&1
xattr -w com.apple.metadata:_kMDItemUserTags "(Gray)" "$ARCHIVE_FOLDER" > /dev/null 2>&1

NOW=$(date +"%Y-%m-%d %H%M%S")
FOLDER_FOR_NOW="${ARCHIVE_FOLDER}/${NOW}"

mkdir -p "${FOLDER_FOR_NOW}" > /dev/null 2>&1


FILES_TO_ARCHIVE=$(find "$FOLDER_TO_SCAN" -maxdepth 1 -ctime +3 -exec sh -c 'xattr -p com.apple.metadata:_kMDItemUserTags "$1" >/dev/null 2>&1 || echo "$1"' sh {} \;)

if [ "$FILES_TO_ARCHIVE" == "" ]; then
	exit
fi

while IFS= read -r f
do
	mv "${f}" "${FOLDER_FOR_NOW}/$(basename "${f}")"
done  <<< "$FILES_TO_ARCHIVE"


if [ -z $(find "$FOLDER_FOR_NOW" -mindepth 1 -print -quit) ]; then
	rmdir "$FOLDER_FOR_NOW"
fi
