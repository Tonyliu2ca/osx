# Mount the install media.
hdiutil attach -noverify -mountpoint /tmp/installesd /Applications/Install\ OS\ X\ Mavericks.app/Contents/SharedSupport/InstallESD.dmg
# Create a sparse read/write disk image.
hdiutil create -size 32g -type SPARSE -fs HFS+J -volname "Macintosh HD" -uid 0 -gid 80 -mode 1775 /tmp/output.sparseimage
# Attach it.
hdiutil attach -noverify -mountpoint /tmp/os -owners on /tmp/output.sparseimage
# Install the OS.
installer -pkg /tmp/installesd/Packages/OSInstall.mpkg -target /tmp/os
# Detach the images.
hdiutil detach /tmp/os
hdiutil detach /tmp/installesd
# Convert the image to read only.
hdiutil convert -format UDZO /tmp/output.sparseimage -o output.dmg
# Scan the image for restore. (Not actually in installesdtodmg.sh!)
asr imagescan --source /tmp/output.dmg