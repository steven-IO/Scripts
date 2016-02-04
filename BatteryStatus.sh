#Display the battery status

BATT_INFO=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage:\|state:\|time\ to\ empty:\|time\ to\ full:")

notify-send --urgency='low' "$(echo $BATT_INFO | sed 's/\(.*\)time\(.*\)/\1\ntime\2/g' | sed 's/\(.*\)perc\(.*\)/\1\nperc\2/g')"

#notify-send --urgency='low' "$BATT_INFO"
