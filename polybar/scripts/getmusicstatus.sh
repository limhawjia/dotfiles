#!/bin/zsh

info=$(playerctl metadata --format '{{artist}}: {{title}}' 2>/dev/null)
s=$?

if [ $s -ne 0 ]; then
    echo Unavailable
else
    truncated=$(echo $info | cut -c1-80)
    echo $truncated
fi
