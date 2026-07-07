#!/bin/bash

sleep 5 && \
    xinput set-prop "Synaptics TM3336-001" "libinput Tapping Enabled" 1 && \
    xinput set-prop "Synaptics TM3336-001" "libinput Disable While Typing Enabled" 0 && \
    notify-send "Настройки тачпада применены"

xset dpms 0 0 0
xset s off
xset s noblank
xset s noexpose

xrdb -merge ~/.Xresources

sleep 3 && kbdd
