# Docker-Keygen

Use docker and dev containers to generate SSH keys and self-signed certificates

## Description

This project uses ssh-keygen and openssl command line utilities in docker containers to allow certificate and SSH key generation
in a platform agnostic way.

## Getting Started

### Dependencies

* Docker

### Executing certgen

* Navigate to PROJECT_ROOT/certgen
* Run ./generate-cert.sh

### Executing ssh-keygen

* Navigate to PROJECT_ROOT/ssh-keygen
* Run ./build.sh
* Run GITHUB_EMAIL="something@email.com" ./generate-key.sh