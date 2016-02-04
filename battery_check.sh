#!/bin/sh
#
# This script checks the battery level and if it is below a certain percent it sends a notification.

LEVL=20

BATT_INFO=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage:\|state:\|time\ to\ empty:")

PERCENTAGE=$(echo ${BATT_INFO} | sed 's/.*percentage:\s\([0-9]*\)%/\1/g')
STATE=$(echo ${BATT_INFO} | sed 's/.*state:\s\([a-z]*\)\s.*$/\1/g')

#Change to -eq after test
if [ ${PERCENTAGE} -le ${LEVL} ] && [ "${STATE}" = 'discharging' ]; then
    TIME_LEFT="$(echo ${BATT_INFO} | sed 's/.*\(time.*\)\spercentage.*/\1/g')"
        notify-send --urgency='critical' "<u>Low Battery</u>\n${PERCENTAGE} percent left\n${TIME_LEFT}"
fi
