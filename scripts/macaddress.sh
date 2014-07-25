#!/bin/bash

# Mac Address.
/usr/sbin/networksetup -getMACADDRESS en0 | awk '{print $3}'

# Mac Address as a string.
/usr/sbin/networksetup -getMACADDRESS en0 | awk '{print $3}' | sed s/://g