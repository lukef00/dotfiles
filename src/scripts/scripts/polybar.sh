#!/bin/sh

polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-main.log
polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown

