#!/bin/sh

# A little CLKF to make some unique filenames every run.  This will pay off later...

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

#clear

echo
# mmm pretty colors.... they blend right into Raspbian boot!

echo "[ $(tput setaf 6)PiDrive$(tput sgr0) ]" Preparing the Workspace...
echo
# these are the processes that will foce airmon-ng to complain, so we stop them first.
### VERY IMPORTANT NOTE: If you want Raspbian to work like normal (networking), DON'T
### let these run at startup.  Seriously.  You won't even get an IP address over
### ethernet if you kill these on boot.  Comment out this script from /etc/rc.local
### if you want to do any tinkering with the pi over a network.  Just don't forget to
### un-comment it when done!

sudo killall avahi-daemon
#sleep 1
sudo killall dhcpcd
#sleep 1
sudo killall wpa_supplicant
#sleep 1

#clear
echo
echo "[ $(tput setaf 6)PiDrive$(tput sgr0) ]"  Starting the Secret Sauce...

# sort of self explanitory.  we output everything we can do /dev/null IOT suppress stuff going to the screen

sudo airmon-ng start wlan2 > /dev/null
sudo airmon-ng start wlan0 > /dev/null
sudo airmon-ng start wlan1 > /dev/null

# backgrounding the airodump processes and outputting the stdout to /dev/null again.  Makes a clean experience.

nohup sudo airodump-ng --gpsd --write /home/pi/chan1.$current_time --channel 1 mon0 > /dev/null 2>&1 &
nohup sudo airodump-ng --gpsd --write /home/pi/chan6.$current_time --channel 6 mon1 > /dev/null 2>&1 &
nohup sudo airodump-ng --gpsd --write /home/pi/chan11.$current_time --channel 11 mon2 > /dev/null 2>&1 &

#clear
# give everything a few seconds to settle before checking it out

sleep 5

echo
echo "[ $(tput setaf 6)PiDrive$(tput sgr0) ]"  Status Report!
echo
# I like seeing that the mon interfaces are up and that the processes are started.
# use the checkmeout.sh to invoke "watch" on the files as they grow!

sudo airmon-ng
sleep 1

ps -ef | grep airodump | awk '{print $7, $8, $9, $10, $11}'
