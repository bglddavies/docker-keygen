#!/bin/bash
set -eou pipefail

DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..
cd "$DIR"

: "${EMAIL:=""}"
: "${OUTPUT_FILE_NAME:="id_rsa"}"

: "${IMAGE_NAME:="alpinesshkeygen"}"
: "${IMAGE_VERSION:="latest"}"

CTAG=""
if [ ! -z "${EMAIL}" ]; then
    CTAG="-C \"${EMAIL}\""
fi

docker run --rm -v "${DIR}/certificates:/certificates" "$IMAGE_NAME:$IMAGE_VERSION" /bin/sh -c "ssh-keygen ${CTAG} -t rsa -b 4096 -f \"/certificates/${OUTPUT_FILE_NAME}\""