#!/bin/sh

# ps -ef | grep airodump
watch -n 1 "ls -al | grep cap | awk '{print \$5, \$9}'"
# xterm -e watch -n 2 "ls /root -alh | grep cap | awk '{print \$5, \$9}'" &
# ls /root -alh | grep nohup

