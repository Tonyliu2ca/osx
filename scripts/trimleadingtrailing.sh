#!/bin/bash

output=" This is a test "

# sed
echo "${output}" | sed -e 's/^[ \t]*//'

# awk
 
## Use awk to trim leading and trailing whitespace
echo "${output}" | awk '{gsub(/^ +| +$/,"")} {print $0}'