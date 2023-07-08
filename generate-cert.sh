#!/bin/bash
set -eou pipefail
: "${GITHUB_EMAIL}:?"GITHUB_EMAIL must be set. Aborting."}"
: "${OUTPUT_FILE_NAME:="id_rsa"}"

: "${IMAGE_NAME:="alpinesshkeygen"}"
: "${IMAGE_VERSION:="latest"}"

docker run --rm -v certificates:/certificates "$IMAGE_NAME:$IMAGE_VERSION" /bin/sh -c "ssh-keygen -t rsa -b 4096 -C \"$GITHUB_EMAIL\" -f \"/certificates/${OUTPUT_FILE_NAME}\""