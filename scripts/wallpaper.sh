#!/bin/bash

WP_FILE=$HOME/Pictures/wallpaper/wallpaper.jpg

wget -q --spider https://source.unsplash.com

if [ $? -eq 0 ]; then
    wget -q -O "$WP_FILE" https://source.unsplash.com/1920x1080/?city,night,ocean,space,fire,hell,tokyo
    if [[ -f "${WP_FILE}" ]]; then
        nitrogen --restore
    fi
else
    echo "Offline"
fi