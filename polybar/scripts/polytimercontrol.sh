#!/bin/zsh

arg=$1
valuefile=/tmp/polybartimervalue
counterfile=/tmp/polybartimercounter

function up() {
    while read p; do
        echo $p
        polybar-msg -p $p hook polytimercontrol 2
    done < <(pgrep -x polybar)
}

if [[ $arg == 'init' && ! -a $counterfile ]]; then
    echo 20 > $counterfile
    up
elif [[ $arg == 'start' ]]; then
    echo "Starting" > $valuefile
    polytimer $(cat $counterfile) $valuefile &
elif [[ $arg == 'increase' ]]; then
    new=$(( $(cat $counterfile) + 1 ))
    echo $new > $counterfile
    up
elif [[ $arg == 'decrease' ]]; then
    new=$(( $(cat /tmp/polybartimercounter) - 1 ))
    if [[ new -gt 0 ]]; then
        echo $new > $counterfile
    fi
    up
elif [[ $arg == 'kill' ]]; then
    kill $(pgrep -x polytimer)
fi

echo "   [$(cat $counterfile)]"
