#!/usr/bin/env bash

# This script should be run with 'sudo'

# Prerequisites
# - internet connection

wget https://www.adsbhub.org/downloads/adsbhub.php --no-check-certificate -O /usr/bin/adsbhub.sh
chmod 755 /usr/bin/adsbhub.sh

cp ./systemd-units/*.service /lib/systemd/system/

systemctl enable dump1090.service
systemctl enable adsbhub.service
systemctl enable sdrmonitor.service

systemctl daemon-reload

systemctl start sdrmonitor.service
systemctl start dump1090.service
systemctl start adsbhub.service
