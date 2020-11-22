#!/usr/bin/bash

CONF=$HOME/.config/alacritty/alacritty.yml
DARK=$HOME/.config/alacritty/dark.yml
LIGHT=$HOME/.config/alacritty/light.yml
START_OF_THEME=35
BACKUP=false

CONTINUE=true

if [[ $1 != "dark" && $1 != "light" ]]; then
    echo "Usage: switchcolors [light|dark]"
    CONTINUE=false
fi

if [[ $CONTINUE == "true" && $BACKUP == "true" ]]; then
    basepath=$(dirname "${CONF}")
    timestamp=$(date +%s)
    filepath="${basepath}/alacritty.${timestamp}.backup.yml"
    cp $CONF $filepath
    echo "Created backup"
fi

if [[ $CONTINUE == "true"  && $1 == "dark" ]]; then
    echo "Switching to dark mode"

    if [[ ! -f $DARK ]]; then
        echo "Error: ${DARK} not found"
        CONTINUE=false
    fi

    if [[ $CONTINUE == "true" ]]; then
        export COLORMODE=dark
        sed -i "${START_OF_THEME},\$d" $CONF;
        cat $DARK >> $CONF;
        CONTINUE=false
    fi
fi

if [[ $CONTINUE == "true" && $1 == "light" ]]; then
    echo "Switching to light mode"

    if [[ ! -f $LIGHT ]]; then
        echo "Error: ${LIGHT} not found"
        CONTINUE=false
    fi

    if [[ $CONTINUE == "true" ]]; then
        export COLORMODE=light
        sed -i "${START_OF_THEME},\$d" $CONF;
        cat $LIGHT >> $CONF;
        CONTINUE=false
    fi
fi
