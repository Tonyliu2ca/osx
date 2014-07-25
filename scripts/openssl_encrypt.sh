#!/bin/sh

in="$1"
out="$2"

openssl des3 -in "$1" -out "$2"

exit 0