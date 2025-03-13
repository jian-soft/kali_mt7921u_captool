#!/bin/sh

device=$(sudo airmon-ng | grep mt7921u)
echo ${device}

if [ -z "${device}" ]; then
        echo "No mt7921u device found, exit."
        exit
fi

wlan0mon=$(ifconfig wlan0mon 2>/dev/null)

if [ -n "${wlan0mon}" ]; then
        echo "Already in monitor mode"
        iw wlan0mon info
        exit
fi

sudo airmon-ng check kill

sudo airmon-ng start wlan0 149

iw wlan0mon info
