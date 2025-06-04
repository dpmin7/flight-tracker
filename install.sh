#!/usr/bin/env bash

# This script should be run with 'sudo'

# Prerequisites
# - copy {dump1090,adsbhub}.service at /lib/systemd/system/

wget https://www.adsbhub.org/downloads/adsbhub.php --no-check-certificate -O /usr/bin/adsbhub.sh
chmod 755 /usr/bin/adsbhub.sh

systemctl enable dump1090.service
systemctl enable adsbhub.service

systemctl daemon-reload

systemctl start dump1090.service
systemctl start adsbhub.service
