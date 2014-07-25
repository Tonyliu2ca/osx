#!/bin/bash

# Hardware model.

sysctl hw.memsize | awk '{ print $2 }'