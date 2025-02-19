#!/bin/sh

NAME=${NAME:-myKey}

Folder="/output/${NAME}"

echo "Creating Folder ${Folder}..."

mkdir -p "${Folder}" || echo "Warn: Error creating folder $?"

cd "${Folder}" || exit 1

echo "Generating key ${NAME} in file ./id_rsa"

ssh-keygen -t rsa -b 4096 -C "${NAME}" -f ./id_rsa

echo "Converting key to ppk..."

puttygen ./id_rsa -o ./id_rsa.ppk
