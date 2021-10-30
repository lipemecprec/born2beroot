#!/bin/bash

touch temp
MIN=$(who -b | sed s/.*:[0-9]/''/)
STAR="0-23 1-31 1-12 0-6"
MONIT="/home/felipe/born2beroot/monitoring.sh"
TIMING="0$MIN,1$MIN,2$MIN,3$MIN,4$MIN,5$MIN $STAR $MONIT"
CRON="$TIMING"
SET_CRON="/home/felipe/born2beroot/set_cron.sh"
echo "# This cron tab is auto generated via script..." > temp
echo "@reboot $SET_CRON" >> temp
echo $CRON >> temp
crontab temp
rm temp
