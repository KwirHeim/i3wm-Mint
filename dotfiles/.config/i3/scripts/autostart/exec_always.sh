#!/bin/bash

setxkbmap -layout us,ru -option grp:caps_toggle

feh --no-fehbg --bg-scale ~/.config/i3/desktop.png

pgrep -x xsettingsd >/dev/null || xsettingsd &
pgrep -x lxpolkit >/dev/null || lxpolkit &
pgrep -x dunst >/dev/null || dunst &
pgrep -x flameshot >/dev/null || flameshot &
pgrep -x diodon >/dev/null || diodon &
pgrep -x blueman-applet >/dev/null || blueman-applet &
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x pasystray >/dev/null || pasystray --notify=volume &
#pgrep -x picom >/dev/null || picom &
