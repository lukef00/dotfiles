#!/bin/sh

MAC="98:D3:31:01:88:3A"
ACTIONS="connect |disconnect ﳌ"

ACTION="$(echo ${ACTIONS} | rofi -sep '|' -p ' Headphones' -dmenu)"

#bluetoothctl  ${MAC}
