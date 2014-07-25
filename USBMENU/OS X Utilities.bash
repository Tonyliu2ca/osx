
#!/bin/bash

#++ must sudo
if [[ $(id -u) -ne 0 ]]; then
	echo "Run this script with sudo."
	exit 1
fi

#++ usage
if [ $# -eq 0 ]; then
cat <<EOF

	Usage:
	sudo $(basename "$0") TARGET_VOLUME SOURCE_FILE

EOF
exit 1
fi

if [[ "${2}" == *.pkg ]]; then
	echo "installer -pkg $2 -target $1"
	#installer -pkg "${2}" -target "${1}"
fi

if [[ "${2}" == *.dmg ]]; then
	echo "Very basic example...this will erase the disk."
	echo "asr -source $2 -target $1"
	#sudo asr -restore -source "${2}" -target "${1}" -erase -format HFS+ -noverify
fi


exit 0





















# Maybe come back to this...
# This is just a template. AND ITS A WORK IN PROGRESS
# maybe just make it a bash_profile and set the Recovery HD to open Terminal instead of OS X Utilities.app
# lots of variables going on here, more thought required
# lets assume for now:
  # the person using this boot disk knows what they are doing!
  # only one dev is connected, ie. we are only concerned with /dev/disk0
  # the disk is either not partitioned "Macintosh HD"
    # or the disk is partitioned "System" and "Data"
    # if it is already partitioned it was done so using standards, ie. 50%/50% or min50gb/*
# TODO, better error checking. /dev etc

autoDMG=0
partitionType=0
macHDPartition=0
sysPartition=0
dataPartition=0
customPartition=0

export PS3='
   Restore a DMG/Install a PKG [1-9] or [q] to quit:'

clear

function diskManage () {
clear

# show /dev/ some info
echo "Devices =>"
diskutil list
echo "
Volumes =>"
df -k | grep Volumes

# more than 2 existing partitions? user must specify TARGET
volumeCount=$(df -k | grep Volumes | wc -l)
if [[ ${volumeCount} -gt 2 ]]; then
  echo "
Partitioned, but more than 2 volumes so you will need to specify the TARGET..."
  customPartition=1
fi

if [ ${1} == asrRestore ]; then
  autoDMG=1
fi

echo "
Looking for a SYSTEM partition => "
df -k | grep "/Volumes/System" > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Found."
  sysPartition=1
else
  echo "Not found."
fi

echo "
Looking for a DATA partition => "
df -k | grep "/Volumes/Data" > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Found."
  dataPartition=1
else
  echo "Not found."
fi

echo "
Looking for a Macintosh HD partition => "
df -k | grep "/Volumes/Macintosh\ HD" > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Found."
  macHDPartition=1

  # how big is Macintosh HD
  echo "Checking Macintosh HD size => "
  diskSize=$(diskutil info /Volumes/Macintosh\ HD | grep Total | awk '{print $5}' | sed s/\(//g)
  if [[ $(($diskSize / 1073741824)) -gt 100 ]]; then
    echo "Partition 50/50"
    partitionType=1
  else
    echo "Partition 50gb/*"
    partitionType=2
  fi

else
  echo "Not found."
fi

#echo " "
#echo "AutoDMG : $autoDMG"
#echo "System Partition : $sysPartition"
#echo "Data Partition : $dataPartition"
#echo "Custom Partition : $customPartition"
#echo " "

if [ ${volumeCount} == 1 ]; then
  if [ ${macHDPartition} == 1 ]; then
    echo "diskutil eraseVolume HFS+ Macintosh\ HD /Volumes/Macintosh\ HD"
    if [ ${partitionType} == 1 ]; then
      echo "
System and Data."
      echo "diskutil resizeVolume /Volumes/Macintosh\ HD 50% HFS+ Data 0b"
    else
      echo "diskutil resizeVolume /Volumes/Macintosh\ HD 50gb HFS+ Data 0b"
    fi
    echo 'diskutil rename "Macintosh HD" "System"'
  else
    echo "One partition found but its not Macintosh HD... so existing."
    exit 1
  fi
else
  if [ ${volumeCount} == 2 ]; then
    if [ ${sysPartition} == 1 ]; then
      echo "
System only."
    fi
  else
    echo "
There seems to be more than 2 partitions... so exiting."
    exit 1
  fi
fi


if [ ${autoDMG} == 1 ]; then
  echo "sudo asr -restore -source /INSTALL/${fileName} -target /Volumes/System -erase -format HFS+ -noverify"
else
  echo "installer -pkg /INSTALL/${fileName} -target /Volumes/System"
fi

}

fileList=$(find /INSTALL -maxdepth 1 -type f | grep '.dmg\|.pkg' | sed s/\\/INSTALL//g | sed s/\\///g)
if [ $? -eq 0 ]; then
  echo "   O S X | E N T E R P R I S E"
  echo "   The following disk images and osx installers have been found."
  echo " "
else
  clear
fi

select fileName in $fileList; do
  	if [ -n "$fileName" ]; then
    	export InstallerFile="${fileName}"
  	fi
  	if [[ "${fileName}" == *.pkg ]]; then
  		diskManage osxInstall
  	fi
  	if [[ "${fileName}" == *.dmg ]]; then
  	 diskManage asrRestore
    fi
  break
done
