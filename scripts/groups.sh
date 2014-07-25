#!/bin/bash

# Create a group
sudo dscl . -create /Groups/newgroup
sudo dscl . -create /Groups/newgroup PrimaryGroupID 1000

# Add everyone to it
sudo dseditgroup -o edit -a everyone -t group newgroup

# Add network accounts (AD Users) to it
sudo dseditgroup -o edit -a netaccounts -t group newgroup

# Add local administrators to it
sudo dseditgroup -o edit -a admin -t group newgroup

# Add user cgerke to group
sudo dseditgroup -o edit -a cgerke -t user newgroup

# Add everyone as lpadmin
sudo dseditgroup -o edit -a everyone -t group lpadmin


# View group detail
dscacheutil -q group



exit 0