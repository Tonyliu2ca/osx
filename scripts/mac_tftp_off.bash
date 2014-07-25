#!/bin/bash

sudo chown -R root:wheel /private/tftpboot
sudo chmod -R 755 /private/tftpboot

sudo launchctl unload -F /System/Library/LaunchDaemons/tftp.plist

exit 0