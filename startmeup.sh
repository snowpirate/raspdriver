#!/bin/sh

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

#clear

echo
echo "[ $(tput setaf 6)PiDrive$(tput sgr0) ]" Preparing the Workspace...
echo

sudo killall avahi-daemon
#sleep 1
sudo killall dhcpcd
#sleep 1
sudo killall wpa_supplicant
#sleep 1

#clear
echo
echo "[ $(tput setaf 6)PiDrive$(tput sgr0) ]"  Starting the Secret Sauce...

sudo airmon-ng start wlan2 > /dev/null
sudo airmon-ng start wlan0 > /dev/null
sudo airmon-ng start wlan1 > /dev/null

nohup sudo airodump-ng --write /home/pi/chan1.$current_time --channel 1 mon0 > /dev/null 2>&1 &
nohup sudo airodump-ng --write /home/pi/chan6.$current_time --channel 6 mon1 > /dev/null 2>&1 &
nohup sudo airodump-ng --write /home/pi/chan11.$current_time --channel 11 mon2 > /dev/null 2>&1 &

#clear

sleep 5

echo
echo "[ $(tput setaf 6)PiDrive$(tput sgr0) ]"  Status Report!
echo

sudo airmon-ng
sleep 1

ps -ef | grep airodump | awk '{print $7, $8, $9, $10, $11}'
