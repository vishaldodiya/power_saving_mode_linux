#!/bin/bash

#Lowering the priority of root processes

for pid in `ps -ef | grep root | awk '{print $2}'` ;
do renice 0 $pid ;
done
echo "Lowered the priorities of root processes"

#Checks the status of wifi connection

link_status=`sudo ethtool wlan0 | grep Link`
link=${#link_status}

#Disable Wifi connection if wifi is not connected 

if [ $link == 18 ]
then                          
sudo iwconfig wlan0 txpower off
echo "Wifi disabled"
fi

#Disable Bluetooth

sudo rfkill block bluetooth
echo "Bluetooth turned off"

#Reducing Screen Brightness

#xbacklight -set 5
echo "Screen Brightness set to 5%" 

#Reducing cpu clock speed

#cpufreq -set -f 1700
echo "cpu clock speed reduced"

#Enable hard disk power saving mode

#hdparm -B 1 -s 12 /dev/sda
echo "Hard disk power saving mode on"

#Turn off screen saver
xset s off
echo "Screen saver off"

#Disable Display power management signaling
xset -dpms
echo "DPMS off"
#xset -q                -display status
echo "Power Saving Mode Enabled."
