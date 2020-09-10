#!/bin/sh

ip=$(curl -4 -sf ifconfig.co)
if [[ -z $ip ]]; then
    echo "%{F#BF616A}   Unavailable%{F-}"
else
    echo "%{F#A3BE8C}   $ip%{F-}"
fi

