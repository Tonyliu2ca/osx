#!/bin/bash

# diskutil list                      # List the partitions of a disk
# diskutil unmountDisk /dev/disk1    # Unmount an entire disk (all volumes)
# chflags hidden ~/Documents/folder  # Hide folder (reverse with unhidden)

# resize if smaller than total
diskutil resizeVolume disk0s4 limits

diskutil resizeVolume disk0s4 15448104960B