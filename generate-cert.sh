#!/bin/bash
: "${GITHUB_EMAIL}:?"GITHUB_EMAIL need to be set. Aborting."}"
ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL" -f ./certificates/id_rsa