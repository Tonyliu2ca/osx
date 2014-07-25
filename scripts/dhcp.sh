#!/bin/bash

if_file="/etc/sysconfig/network-scripts/ifcfg-"$1

dhcp=$(grep "dhcp" $if_file 2>/dev/null)

if [ "$dhcp" != "" ];
then
echo "Enabled"
else
echo "Disabled"
fi