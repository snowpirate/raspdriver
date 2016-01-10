# raspdriver
A Raspberry Pi based Automatic Wardriving Solution


Abstract

This collection of short BASH scripts allows a stock Raspberry Pi to become an automotive accessory that captures packets as you drive around.  The overall goal is to make it autonomous, requiring no user intervention whatsoever.  The final goal will be to port the entire project over to Python.


Info

The project was originally built with parts laying around, so I'll do my best to find them for sale online and put in here.  Level of detail in this version is not walkthrough from start to finish, assumes you can do "some assembly required" projects and put it all together.  Best effort is given to make it a logical flow.

I went with a wireless keyboard & the touchsceen to be able to have a standalone machine for troubleshooting/usage in car.  Not really required, but it is pretty sweet to have.  The other option is bring something else that can SSH into the pi (yuck!).  "But why byobu then?" For the times when NOT in the car, I prefer SSH'ing into the pi to set it up, and that's my preferred interface :-)

Yes, I realize some of this is not as "streamlined" as possible, but it's the configuration that works for me, I intend on doing other things with the project after playing with this for a while, so some "modularity" was taken to be able to swap between projects.



Project Setup

1. Make bootable OS SD card with latest Raspbian
2. Install the touchscreen (this is where you can get creative.  I recommend making a "case" for everything at this point)
3. Boot up and install required software (give it the internet)
4. Get the GPS setup (See link to blog)
5. Modify the Automotive DC plugs to provide power to the Pi and the USB Hub & Install in Housing.
    ! This part is particularly important, as the USB hub needs to be powered.
    ! The Pi doesn't have the power available to power the GPS and WiFi Dongles.

    a. Automotive DC plug will terminate into the input of the 2 step down transformers.
    b. The output of the step down transformers will be the male 2.1 x 5.5mm DC Power Pigtails.
    c. Give one pigtail the DC to USB adaptor for the Pi, Screen, and UPS.
    d. Give the other pigtail directly into the USB hub
6. Install the UPS
7. Clone this repository to the ~/ directory of the Pi
8. Add the line: [ home/pi/startmeup.sh ]
    to the Pi's /etc/rc.local to ensure it runs at startup.
9. Setup UPS script to execute powerdown.sh whenever power is lost. *** Work in progress.





Software

Raspbian (use this for download of image and installation of OS)
https://www.raspberrypi.org/documentation/installation/installing-images/README.md

Aircrack-ng (required for this to work)
http://aircrack-ng.org/doku.php?id=airodump-ng

Byobu (because I like this over screen/tmux)
http://byobu.co

Apt Packages Installed
vim (fav editor)




Hardware

7" TouchScreen
http://www.element14.com/community/docs/DOC-78156?ICID=rpiaccsy-topban-products
http://www.amazon.com/OFFICIAL-RASPBERRY-FOUNDATION-TOUCHSCREEN-DISPLAY/dp/B0153R2A9I

GPS
http://blog.retep.org/2012/06/18/getting-gps-to-work-on-a-raspberry-pi/

PiUPS #1
http://www.amazon.com/Pi-UPS-Raspberry-Backup-Supply/dp/B00JNFP71A
http://piups.net/support/
Pi UPS - Raspberry Pi Backup Power Supply by CW2.
* This one didn't work for me.  It wasn't recognized (perhaps due to the touchscreen) so it never shut the Pi down.
* It did however keep it running when power was lost, so that was nice until the second UPS arrives.

DC to USB (For Pi Power)
http://www.amazon.com/Super-Power-Supply®-5-5x2-1mm-2-1xmm/dp/B00S6N5I64
Super Power Supply® 5.5x2.1mm (5.5mm 2.1xmm) Female to Micro USB Male Plug Charge Cable Plug

DC Step Down Transformer
http://www.amazon.com/SINOLLC-Converter-Regulator-Regulated-Transformer/dp/B00J3MHTYG
SINOLLC DC 12V 24V to 5V 3A Converter Step Down Regulator 5V Regulated Power Supplies Transformer Converter

Automotive Plug with Two Tails
http://www.amazon.com/Sylvania-SDVD8727-SDVD8730-SDVD8732-SDVD8716-COM/dp/B007QP7582
EDO Tech® 11' Long Twin Plug Car Charger Cable DC Adapter for Sylvania SDVD8727 SDVD8730 SDVD8732 SDVD8716-COM Dual Screen DVD Player

10 Pack of DC plugs
http://www.amazon.com/MassMall-Quality-10pack-5-5mm-Pigtail/dp/B00XTY8WUY
MassMall High Quality 10pack 10 inch(30cm) 2.1 x 5.5mm DC Power Pigtail MALE

Wireless Keyboard
http://www.amazon.com/Rii-mini-X1-Raspberry-KP-810-10LL/dp/B00I5SW8MC
Rii Mini Wireless 2.4GHz Keyboard with Mouse Touchpad Remote Control, Black (mini X1) for Raspberry pi/HTPC/XBMC/Google and Android TV KP-810-10LL

Alfa WiFi Cards
Alfa Brand AWUS036EW
http://www.alfa.net.my/webshaper/store/viewProd.asp?pkProductItem=27
* I believe these have been replaced with a 1000mw version:
* http://www.amazon.com/802-11g-Wireless-Long-Rang-Network-Adapter/dp/B0035GWTKK

USB Hub
http://www.amazon.com/USB-3-0-4-Port-HUB-JUH340/dp/B00HLOLQ6K
j5create USB 3.0 4-Port HUB JUH340


