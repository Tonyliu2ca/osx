#!/bin/bash
#
# Declarations:
# -r read only
# -i integer
# -a array
# -f funtion
# -x declares and export to subsequent commands via the environment.

declare -r WORKING_PATH=$(dirname "${0}")

# Encrypt
openssl enc -aes-256-cbc -salt -in "${1}" -out "${1}.enc"

# Decrypt
# openssl enc -d -aes-256-cbc -in "${1}" -out "${WORKING_PATH}/"

exit 0