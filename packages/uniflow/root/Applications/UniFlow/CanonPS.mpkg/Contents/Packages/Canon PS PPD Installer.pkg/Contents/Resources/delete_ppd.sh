#
# Copyright(C) Canon Inc. All right reserved.
#

#!/bin/sh

DstPath="/Library/Printers/PPDs/Contents/Resources/en.lproj"

if [ -d "$DstPath" ];
then
	#v2.xのPPDを削除
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SJP.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SUK.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SUS.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SFR.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SIT.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SDE.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SSP.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SSC.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*STC.ppd.gz 2>/dev/null
	rm /Library/Printers/PPDs/Contents/Resources/en.lproj/CNMC*SKR.ppd.gz 2>/dev/null

	OSVER=`./getOSVersion`

	if [ "$OSVER" -ge 1050 ];
	then
		PPDFOLDERv105=`find ./Software -type d | grep '/PPD/osver_l1050'`
		find "$PPDFOLDERv105" -type f -print0 | xargs -0 basename |
		while read SrcPPD
			do
			if [ -e "$DstPath"/"$SrcPPD" ];
			then
				rm -rf "$DstPath"/"$SrcPPD"
			fi
		done

		FileCount=`ls "$DstPath" | wc -l`
		if [ "$FileCount" -eq 0 ];
		then
			rm -rf "$DstPath"
		fi

	fi

fi
