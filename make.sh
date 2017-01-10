#!/bin/bash
#
# This script will build the executable and leave it in this directory.
#
# If the first argument to the script is set to "alpine", then it will
# build a binary for Alpine Linux.
#

IMAGE=$([ "$1" == "alpine" ] && echo "golang:alpine" || echo "golang")
SRCDIR=/go/src/github.com/subfuzion/envtpl


docker $DOCKER_OPTIONS run -t --rm -v "$PWD":$SRCDIR -e GOOS=${GOOS:-linux} -e GOARCH=${GOARCH:-amd64} -w $SRCDIR $IMAGE go build -v .
