#!/bin/sh

shortname="$1"

sudo dscl . -delete /users/${shortname}
sudo dscl . -delete /users/${shortname}@domain.com

exit 0