#!/bin/bash

__LIST_PATH="$1"
__TO_DIR="$2"

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__dotbrick_path=~/.dotbrick

while read -r dir; do
  if [[ -z "$dir" ]]; then
    continue
  fi

  __CONFIG_FILE="$__dotbrick_path"/"$dir".txt
  if [[ -r "$__CONFIG_FILE" ]]; then
    source "$__dir"/copy-by-list.sh "$__CONFIG_FILE" "$__TO_DIR"
    continue
  fi

  __PKG_PATH="$__dotbrick_path"/"$dir"
  if [[ ! -d "$__PKG_PATH" ]]; then
    continue
  fi

  cp -r "$__PKG_PATH" "$__TO_DIR"
done < <(cat "$__LIST_PATH")
