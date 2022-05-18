#!/bin/bash

__USER_NAME=$1
__REPO_NAME=$2
__TAG_NAME="$__USER_NAME"/"$__REPO_NAME"

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$__dir"/build-docker.sh "$__REPO_NAME"
docker login --username "$__USER_NAME"
docker tag "$__REPO_NAME" "$__TAG_NAME"
docker push "$__TAG_NAME"
docker image remove --force "$__TAG_NAME"
