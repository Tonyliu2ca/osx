#!/bin/bash

dev_os=$(defaults read "/System/Library/CoreServices/SystemVersion" ProductVersion)	# 10.9 etc
dev_build=$(defaults read "/System/Library/CoreServices/SystemVersion" ProductBuildVersion) # 13A603 etc

defaults write "/System/Library/User Template/English.lproj/Library/Preferences/com.apple.SetupAssistant.plist" DidSeeCloudSetup -bool true
defaults write "/System/Library/User Template/English.lproj/Library/Preferences/com.apple.SetupAssistant.plist" GestureMovieSeen none
defaults write "/System/Library/User Template/English.lproj/Library/Preferences/com.apple.SetupAssistant.plist" LastSeenCloudProductVersion "${dev_os}"
defaults write "/System/Library/User Template/English.lproj/Library/Preferences/com.apple.SetupAssistant.plist" LastPreLoginTasksPerformedVersion "${dev_os}"
defaults write "/System/Library/User Template/English.lproj/Library/Preferences/com.apple.SetupAssistant.plist" LastPreLoginTasksPerformedBuild "${dev_build}"

for i in `ls "${path_root}/Users"`
	do
	 if [ -d "${path_root}/Users/${i}/Library/Preferences" ]; then
	  	# com.apple.SetupAssistant.plist
		defaults write "${path_root}/Users/${i}/Library/Preferences/com.apple.SetupAssistant.plist" DidSeeCloudSetup -bool true
		defaults write "${path_root}/Users/${i}/Library/Preferences/com.apple.SetupAssistant.plist" GestureMovieSeen none
		defaults write "${path_root}/Users/${i}/Library/Preferences/com.apple.SetupAssistant.plist" LastSeenCloudProductVersion "${device_os}"
		defaults write "${path_root}/Users/${i}/Library/Preferences/com.apple.SetupAssistant.plist" LastPreLoginTasksPerformedVersion "${device_os}"
		defaults write "${path_root}/Users/${i}/Library/Preferences/com.apple.SetupAssistant.plist" LastPreLoginTasksPerformedBuild "${device_build}"
		chmod -R 777 "${path_root}/Users/${i}/Library/Preferences/com.apple.SetupAssistant.plist"
	fi 
done

exit 0
