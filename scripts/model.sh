#!/bin/bash

# Hardware model.

sysctl hw.model  | awk '{ print $2 }'
