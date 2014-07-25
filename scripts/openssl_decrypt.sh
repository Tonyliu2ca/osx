#!/bin/sh

in="$1"
out="$2"

openssl des3 -d -in "$1" -out "$2"

exit 0