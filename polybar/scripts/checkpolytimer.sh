#!/bin/zsh

running=$(pgrep -x "polytimer")
valuefile=/tmp/polybartimervalue

if [[ -z $running ]]; then
    echo "%{F#4C566A}Pomodoro Timer%{F-}"
else
    value=$(cat $valuefile)
    echo "%{F#D8DEE9}$value%{F-}"
fi

