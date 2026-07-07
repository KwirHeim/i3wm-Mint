#!/bin/bash

xset dpms 3 0 0 && i3lock -i "$HOME/.config/i3/lock.png" --nofork && xset dpms 0 0 0
