#!/bin/sh

clear

echo
echo Powering Down Fusion Reactors...
echo
# sleep 1

ls -alh /home/pi/*.cap | awk '{print $5, $9}'
echo

echo Please Wait...

sudo killall airodump-ng
sleep 1


zip /home/pi/caps.zip /home/pi/*.cap
sleep 1
zip /home/pi/extras.zip /home/pi/chan* > /dev/null 2>&1

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

mv /home/pi/caps.zip /home/pi/zips/$current_time.caps.zip
mv /home/pi/extras.zip /home/pi/extras/$current_time.extras.zip


sudo rm /home/pi/chan*

sudo airmon-ng stop mon4 > /dev/null 2>&1
sudo airmon-ng stop mon3 > /dev/null 2>&1
sudo airmon-ng stop mon2 > /dev/null 2>&1
sudo airmon-ng stop mon1 > /dev/null 2>&1
sudo airmon-ng stop mon0 > /dev/null 2>&1

sleep 1

#clear

echo
echo Status Report!
echo

sudo airmon-ng

echo
echo All Done!!
echo


