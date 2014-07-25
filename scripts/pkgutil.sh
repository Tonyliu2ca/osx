#!/bin/bash

pkgutil --expand PACKAGE directory
cat Payload | gunzip -dc |cpio -i

exit 0