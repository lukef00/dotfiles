#!/bin/sh

WALLPAPER_FILE="${HOME}/.wallpaper-id"
WALLPAPER_DIR="${HOME}/images"

if [ -e "${WALLPAPER_FILE}" ]; then
    index=$(cat ${WALLPAPER_FILE})
else
    index=0
fi

wallpaper_amount=$(ls -1 ${WALLPAPER_DIR}/*.png | wc -l)

index=$((index+1))

if [ "${index}" -gt "${wallpaper_amount}" ]; then
    index=1
fi

wallpaper="$(ls -1 ${WALLPAPER_DIR}/ | awk '/\w$/ { printf $1 "\n" }'\
    | tail -n ${index} | head -n 1)"
feh --bg-fill ${WALLPAPER_DIR}/${wallpaper}

echo "${index}" > "${WALLPAPER_FILE}"
