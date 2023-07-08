#!/bin/bash

: "${IMAGE_NAME:="alpinesshkeygen"}"
: "${IMAGE_VERSION:="latest"}"

docker build . -t "$IMAGE_NAME:$IMAGE_VERSION"