#!/bin/bash

# enable apache startup
sudo defaults write /System/Library/LaunchDaemons/org.apache.httpd Disabled -bool false

# relocate document root (could edit http.conf instead)
sudo cp -Rf /Library/WebServer/Documents /Users/Shared/www
sudo mkdir /Users/Shared/meta
sudo chown -R root:wheel /Users/Shared/www
sudo chmod -R 755 /Users/Shared/www
sudo mv -f /Library/WebServer/Documents /Library/WebServer/Documents.bak
sudo ln -s /Users/Shared/www /Library/WebServer/Documents
sudo apachectl start

cd /Users/Shared/

sudo git clone https://github.com/wdas/reposado.git
sudo git clone https://github.com/jessepeterson/margarita.git

sudo ./reposado/code/repoutil --configure

# margarita
sudo easy_install flask
sudo ln -s /Users/Shared/reposado/code/reposadolib margarita/reposadolib
sudo ln -s /Users/Shared/reposado/code/preferences.plist margarita/preferences.plist
sudo python ./margarita/margarita.py

# modify this to point to the correct path
sudo cp -f ./margarita/com.github.jessepeterson.margarita.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/com.github.jessepeterson.margarita.plist
sudo chmod 644 /Library/LaunchDaemons/com.github.jessepeterson.margarita.plist

# test
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL "http://reposado.local/content/catalogs/others/index-10.9-mountainlion-lion-snowleopard-leopard.merged-1_test.sucatalog"

exit
