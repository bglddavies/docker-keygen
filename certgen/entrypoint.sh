#!/bin/bash

CERTROOT="/certificates"
# Generate the root signing key
openssl ecparam -out "$CERTROOT/ca-selfsigned.key" -name prime256v1 -genkey

# Generate root CSR from the signing certificate
openssl req -new -sha256 \
    -key "$CERTROOT/ca-selfsigned.key" \
    -out "$CERTROOT/ca-selfsigned.csr" \
    -subj "/C=SS/ST=CA-SELFSIGNED/L=CA-SELFSIGNED/O=CA-SELFSIGNED/OU=CA-SELFSIGNED/CN=CA-SELFSIGNED"

# Generate the root certificate
openssl x509 -req -sha256 -days 3650 \
    -in "$CERTROOT/ca-selfsigned.csr" \
    -signkey "$CERTROOT/ca-selfsigned.key" \
    -out "$CERTROOT/ca-selfsigned.crt"

# Generate server certificate key
openssl ecparam -out "$CERTROOT/selfsigned.key" -name prime256v1 -genkey

# Generate server csr
openssl req -new -sha256 \
    -key "$CERTROOT/selfsigned.key" \
    -out "$CERTROOT/selfsigned.csr" \
    -subj "/C=SS/ST=SELFSIGNED/L=SELFSIGNED/O=SELFSIGNED/OU=SELFSIGNED/CN=SELFSIGNED"

# Generate server certificate and sign with root CA certificate
openssl x509 -req -sha256 -days 3650 \
    -in "$CERTROOT/selfsigned.csr" \
    -CA "$CERTROOT/ca-selfsigned.crt" \
    -CAkey "$CERTROOT/ca-selfsigned.key" \
    -CAcreateserial \
    -out "$CERTROOT/selfsigned.crt" \
    -extfile "/home/ssl.ext"

# Generate the pkcs12 bundle from the certificates
openssl pkcs12 -export \
    -in "$CERTROOT/selfsigned.crt" \
    -inkey "$CERTROOT/selfsigned.key" \
    -chain -CAfile "$CERTROOT/ca-selfsigned.crt" \
    -name "selfsigned" \
    -out "$CERTROOT/selfsigned.p12" \
    -password pass:password