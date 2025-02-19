#!/bin/sh

NAME=${NAME:-myKey}

PKFile="/output/${NAME}.private.key.pem"
PB1File="/output/${NAME}.public.key.pem"
PB2File="/output/${NAME}.public.key.ssh-rsa"

echo "Generating key ${NAME} in file ${PKFile}"

openssl genrsa -aes256 -out "${PKFile}" 4096

echo "Extracting public key ${NAME} in file ${PB1File}"

openssl rsa -in "${PKFile}" -pubout > "${PB1File}"

echo "Extracting public key ${NAME} using ssh-rsa format in file ${PB2File}"

ssh-keygen -i -mPKCS8 -f "${PB1File}" > "${PB2File}"
