#!/bin/bash

# list the shares
# smbclient -U user -I IPADDRESS -L //SMBSHARE/
# mount -t smbfs -o username=USER //SMBSERVER/SMBSHARE /mnt/SMBSHARE
# mount -t cifs -o username=USER,password=PASSWORD //IPADDRESS/SMBSHARE /mnt/SMBSHARE

# with mount.cifs its possible to store the credentials in /Users/USER/.smb
# username=USER
# password=PASSWORD
# mount -t cifs -o credentials=/Users/USER/.smb //IPADDRESS/SMBSHARE /mnt/SMBSHARE