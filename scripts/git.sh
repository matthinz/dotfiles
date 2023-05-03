#!/usr/bin/env bash

# Use `less` as a pager for some commands
git config --replace-all --global pager.diff less
git config --replace-all --global pager.log less
git config --replace-all --global pager.reflog less
git config --replace-all --global pager.show less

# Use `main` as the default branch
git config --replace-all --global init.defaultBranch main

# Use opendiff (FileMerge) for diffs
git config --replace-all --global merge.tool opendiff
