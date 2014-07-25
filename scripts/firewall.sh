#!/bin/bash

# ipfw show                          # For status
# ipfw list 65535 # if answer is "65535 allow ip from any to any" the fw is disabled
# sysctl net.inet.ip.fw.enable=0     # Disable
# sysctl net.inet.ip.fw.enable=1     # Enable