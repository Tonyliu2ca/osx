#!/bin/bash

ROOT="$3"
SCRIPT_DIR="$1/Contents/Resources"
PRINTSERVER="YOURPRINTSERVER"

#* Installing /Applications/UniFLOW/*.pkg
for i in `ls /Applications/UniFLOW | grep '.pkg'`
do
 /bin/echo "Installing $i"
 sudo installer -pkg /Applications/UniFLOW/$i -target /
done

#* Config Uniflow
sudo /usr/bin/defaults write "/Library/Preferences/com.NT-Ware.UniFLOWMacClient" ServerName "$PRINTSERVER.$DOMAIN.com"
sudo /usr/bin/defaults write "/Library/Preferences/com.NT-Ware.UniFLOWMacClient" LogonNoName -bool "false"
sudo /usr/bin/defaults write "/Library/Preferences/com.NT-Ware.UniFLOWMacClient" PopupForEveryJob -bool "false"
sudo /usr/bin/defaults write "/Library/Preferences/com.NT-Ware.UniFLOWMacClient" Reditect -bool "true"
sudo /usr/bin/defaults write "/Library/Preferences/com.NT-Ware.UniFLOWMacClient" LogFileName ""
sudo /usr/sbin/chown root "/Library/Preferences/com.NT-Ware.UniFLOWMacClient.plist"
sudo /bin/chmod 777 "/Library/Preferences/com.NT-Ware.UniFLOWMacClient.plist"
#+ Permissions
sudo /usr/sbin/chown -R root:wheel /Applications/UniFLOW
sudo /bin/chmod -R 755 /Applications/UniFLOW

# Copy PPDs
sudo /bin/cp /Library/Printers/PPDs/Contents/Resources/* /Library/PrintersPPDsDisabled/
sudo /bin/cp /Library/Printers/PPDs/Contents/Resources/en.lproj/* /Library/PrintersPPDsDisabled/
sudo /bin/rm -Rf "/Library/Printers/PPDs/Contents/Resources"
sudo /bin/mkdir -p "/Library/Printers/PPDs/Contents/Resources"
sudo chown root:admin "/Library/Printers/PPDs/Contents/Resources"
sudo chmod 755 "/Library/Printers/PPDs/Contents/Resources"
sudo /bin/cp /Applications/UniFLOW/PPDs/* /Library/Printers/PPDs/Contents/Resources/

#* Add Uniflow queues
sudo lpadmin -p "UniFLOW-BW-SIMPLEX" -D "UniFLOW-BW-SIMPLEX" -E -u allow:all -u deny:none -v "lpd://$PRINTSERVER/UniFLOW-MAC" -P "/Applications/UniFLOW/MomUd-BW-SIMPLEX.PPD" -o printer-is-shared=false
sudo lpadmin -p "UniFLOW-BW-DUPLEX" -D "UniFLOW-BW-DUPLEX" -E -u allow:all -u deny:none -v "lpd://$PRINTSERVER/UniFLOW-MAC" -P "/Applications/UniFLOW/Fiery-BW-DUPLEX.PPD" -o printer-is-shared=false
sudo lpadmin -p "UniFLOW-COLOR-SIMPLEX" -D "UniFLOW-COLOR-SIMPLEX" -E -u allow:all -u deny:none -v "lpd://$PRINTSERVER/UniFLOW-MAC" -P "/Applications/UniFLOW/MomUd-COLOR-SIMPLEX.PPD" -o printer-is-shared=false
sudo lpadmin -p "UniFLOW-COLOR-DUPLEX" -D "UniFLOW-COLOR-DUPLEX" -E -u allow:all -u deny:none -v "lpd://$PRINTSERVER/UniFLOW-MAC" -P "/Applications/UniFLOW/Fiery-COLOR-DUPLEX.PPD" -o printer-is-shared=false

exit 0