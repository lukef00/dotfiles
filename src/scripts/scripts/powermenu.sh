#!/bin/sh

choice="$(printf "lock\nrebot\nshutdown" | rofi -i -dmenu)"


if [ "${choice}" = "lock" ]; then
    i3lock -ef -i ~/images/lockscreen.png
elif [ "${choice}" = "reboot" ]; then
    reboot
elif [ "${choice}" = "shutdown" ]; then
    poweroff
fi
