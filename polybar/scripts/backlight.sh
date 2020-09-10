#!/bin/bash

function up() {
    while read p; do
        echo $p
        polybar-msg -p $p hook backlight 1
    done < <(pgrep -x polybar)
}

arg=$1

if [[ $arg == 'increase' ]]; then
    dim +50
    up
elif [[ $arg == 'decrease' ]]; then
    dim -50
    up
fi

current=$(cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
percentage=$(( current * 100 / max ))

if [ "$percentage" -gt "70" ]; then
    icon=
elif [ "$percentage" -gt "35" ]; then
    icon=
elif [ "$percentage" -gt "0" ]; then
    icon=
fi;

echo "$icon  $percentage%"
