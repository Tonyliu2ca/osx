#!/bin/bash

# Retrive DNS information.

cat /etc/resolv.conf 2>/dev/null | awk '/^nameserver/ { print $2 }'

cat /etc/resolv.conf 2>/dev/null | awk '/^search/ { print $2 }'

cat /etc/resolv.conf 2>/dev/null | awk '/^domain/ { print $2 }'