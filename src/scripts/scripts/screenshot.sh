#!/bin/sh

SCREENSHOT_DIR="${HOME}/images/screenshots"
mkdir -p "${SCREENSHOT_DIR}"

filename="${SCREENSHOT_DIR}/${1}-$(date '+%Y-%m-%d %H:%M:%S').png"
echo $filename

if [ "${1}" = "selection" ]; then
    grim -t png -g "$(slurp -c '#ff0000')" "$filename"
elif [ "${1}" = "screen" ]; then
    grim -t png "$filename"
else
    echo "Invalid option. Expected \"screen\" or \"selection\""
fi
