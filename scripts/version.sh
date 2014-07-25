#!/bin/bash

# Kernel version (and BSD version).
uname -a

# OS Version
defaults read "/System/Library/CoreServices/SystemVersion" ProductVersion

# OS Versions
sw_vers