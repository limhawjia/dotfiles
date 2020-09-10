#!/bin/zsh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        echo "Starting polybar for $m..."
        MONITOR=$m polybar --reload topbar &
        MONITOR=$m polybar --reload bottombar &
    done
else
    polybar --reload topbar &
    polybar --reload bottombar &
fi
