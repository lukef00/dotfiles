#!/bin/sh

SCREENSHOT_DIR="${HOME}/images/screenshots"
SCREENSHOT_NAME="${1}-$(date '+%Y-%m-%d %H:%M:%S').png"

# create directory for screenshots
mkdir -p "${SCREENSHOT_DIR}"

if [ "${1}" = "screen" ]; then
    maim -Bu -m 5 "${SCREENSHOT_DIR}/${SCREENSHOT_NAME}"
elif [ "${1}" = "window" ]; then
    maim -Bu -m 5 -i $(xdotool getactivewindow) "${SCREENSHOT_DIR}/${SCREENSHOT_NAME}"
elif [ "${1}" = "selection" ]; then
    maim -BusD -m 5 "${SCREENSHOT_DIR}/${SCREENSHOT_NAME}"
else
    notify-send "Incorrect command"
fi
