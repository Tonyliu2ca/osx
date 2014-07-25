#!/bin/bash

echo "alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'" >> ~/.bash_profile         # or symlink to /usr/sbin

# airport -z               # Disassociate from wireless networks

airport -I               # Get info from wireless network