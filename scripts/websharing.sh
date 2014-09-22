#!/bin/bash

sudo apachectl start

# enable startup
sudo defaults write /System/Library/LaunchDaemons/org.apache.httpd Disabled -bool false


sudo apachectl stop
sudo cp -Rf /Library/WebServer/Documents /Users/Shared/www
sudo chown -R root:wheel /Users/Shared/www
sudo chmod -R 755 /Users/Shared/www
sudo mv -f /Library/WebServer/Documents /Library/WebServer/Documents.bak
sudo ln -s /Users/Shared/www /Library/WebServer/Documents
sudo apachectl start

exit

# Enable Virtual Hosts and PHP
/etc/apache2/httpd.conf

#Uncomment line 477 (remove the # at the beginning). It should look like:
Include /private/etc/apache2/extra/httpd-vhosts.conf

#If you need to enable the included PHP 5.3.13, uncomment line 117:
LoadModule php5_module libexec/apache2/libphp5.so

sudo apachectl restart

#Root
/Library/WebServer/Documents