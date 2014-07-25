#!/bin/bash

# Use mkisofs to create a CD/DVD image from files in a directory.
# To overcome the file names restrictions: -r enables the Rock Ridge extensions common to UNIX systems, -J enables Joliet extensions used by Microsoft systems. -L allows ISO9660 filenames to begin with a period.

mkisofs -J -L -r -V TITLE -o imagefile.iso /path/to/dir

hdiutil makehybrid -iso -joliet -o dir.iso dir/

exit 0