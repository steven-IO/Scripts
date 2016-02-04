#Display time

TIME_DISPLAY=$(date +'%I:%M%P %A%n%B %d')
notify-send --urgency="low" "$TIME_DISPLAY"
