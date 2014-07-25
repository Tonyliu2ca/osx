#!/bin/bash

WORKING_PATH=$(dirname "${0}")

# Make a copy
ditto "/Volumes/Mac OS X Base System/System/Installation/CDIS/OS X Utilities.app" "${WORKING_PATH}/OS X Utilities.app"

# Add an icon for NetInstall/NetRestore
ditto "/Applications/Utilities/Terminal.app/Contents/Resources/Terminal.icns" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Terminal.icns"

# Add an entry for NetInstall/NetRestore
/usr/libexec/PlistBuddy -c "add Buttons:0 dict" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "add Buttons:0:BundlePath string" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "set Buttons:0:BundlePath /Applications/Utilities/Terminal.app" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "add Buttons:0:DescriptionKey string" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "set Buttons:0:DescriptionKey Reinstall OS X for Work." "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "add Buttons:0:IconName string" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "set Buttons:0:IconName Terminal.icns" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "add Buttons:0:Path string" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "set Buttons:0:Path /Applications/Utilities/Terminal.app/Contents/MacOS/Terminal" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "add Buttons:0:TitleKey string" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
/usr/libexec/PlistBuddy -c "set Buttons:0:TitleKey Reinstall OS X for Work" "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"


# Modify Apple's description.
/usr/libexec/PlistBuddy -c "set Buttons:2:DescriptionKey Reinstall a new copy of OS X from Apple." "${WORKING_PATH}/OS X Utilities.app/Contents/Resources/Utilities.plist"
exit 0