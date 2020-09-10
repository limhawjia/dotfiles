#!/bin/zsh

acpioutput=($(acpi))

state=${acpioutput[3]:0:-1}
percentage=${acpioutput[4]:0:-2}
if [[ $state == 'Charging' ]]; then
    icon="%{F#A3BE8C}  $percentage%%{F-}"
elif [[ $state == 'Full' ]]; then
    icon="%{F#A3BE8C}  100%%{F-}"
elif [ "$percentage" -gt "99" ]; then
    icon="%{F#A3BE8C}  $percentage%%{F-}"
elif [ "$percentage" -gt "80" ]; then
    icon="%{F#A3BE8C}  $percentage%%{F-}"
elif [ "$percentage" -gt "70" ]; then
    icon="%{F#EBCB8B}  $percentage%%{F-}"
elif [ "$percentage" -gt "60" ]; then
    icon="%{F#EBCB8B}  $percentage%%{F-}"
elif [ "$percentage" -gt "50" ]; then
    icon="%{F#EBCB8B}  $percentage%%{F-}"
elif [ "$percentage" -gt "40" ]; then
    icon="%{F#EBCB8B}  $percentage%%{F-}"
elif [ "$percentage" -gt "30" ]; then
    icon="%{F#EBCB8B}  $percentage%%{F-}"
elif [ "$percentage" -gt "20" ]; then
    icon="%{F#EBCB8B}  $percentage%%{F-}"
elif [ "$percentage" -gt "10" ]; then
    icon="%{F#BF616A}  $percentage%%{F-}"
elif [ "$percentage" -gt "0" ]; then
    icon="%{F#BF616A}  $percentage%%{F-}"
fi;

echo "$icon"
