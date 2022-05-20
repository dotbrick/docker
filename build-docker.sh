#!/bin/bash

__config_name="$1"

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__dotbrick_path=~/.dotbrick
__docker_dotfiles_path="$__dir"/.dotbrick

mkdir "$__docker_dotfiles_path"

cp -r "$__dotbrick_path"/_configs "$__docker_dotfiles_path"
cp -r "$__dotbrick_path"/_scripts "$__docker_dotfiles_path"

__config_path="$__dotbrick_path"/_configs/"$__config_name".txt

source "$__dir"/copy-by-list.sh "$__config_path" "$__docker_dotfiles_path"

docker build --progress=plain --tag "$__config_name" --file Dockerfile --build-arg __config_name="$__config_name" .

rm -rf "$__docker_dotfiles_path"
