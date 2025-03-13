#!/bin/sh

if [ $# -lt 2 ]; then
        echo "Usage: $0 channel bw"
        exit
fi

wlan0mon=$(ifconfig wlan0mon 2>/dev/null)
if [ -z "${wlan0mon}" ]; then
        echo "No wlan0mon device found!"
        exit
fi

channel=$1
bw=$2


sudo ifconfig wlan0mon down
sudo iw dev wlan0mon set channel ${channel} ${bw}
sudo ifconfig wlan0mon up

iw wlan0mon info
