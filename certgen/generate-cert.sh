#!/bin/bash
set -eou pipefail

DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$DIR"

ENTRYPOINT=$(cat "$DIR/entrypoint.sh")
docker run --rm \
    -v "$DIR/../certificates:/certificates" \
    -v "$DIR/ssl.ext:/home/ssl.ext" \
    nginx:latest \
    /bin/bash -c "${ENTRYPOINT}"