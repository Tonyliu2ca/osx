#!/bin/bash 
#The command below will remove all .DS_Store
# files from the current directory and any sub directories.
find -type f -name .DS_Store -exec rm {} \;