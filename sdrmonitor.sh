#!/bin/bash

while true; do
    if systemctl is-active -q dump1090.service; then
        if ! lsusb | grep -q "Realtek Semiconductor Corp. RTL2832U DVB-T"; then
            echo "[!] RTL2832U not detected. Killing dump1090 and adsbhub.sh..."
            killall -9 dump1090
            sleep 1
            killall -9 adsbhub.sh
        fi
    fi
    sleep 3
done
