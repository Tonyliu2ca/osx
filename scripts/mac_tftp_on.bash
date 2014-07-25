#!/bin/bash

# Setup some Cisco defaults.
sudo touch /private/tftpboot/running-config
sudo touch /private/tftpboot/startup-config
sudo touch /private/tftpboot/flash
sudo chmod -R 777 /private/tftpboot

# Enable the daemon
sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist

exit 0