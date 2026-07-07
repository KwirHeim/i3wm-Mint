#!/bin/bash

color=$(gpick -pso) && echo -n "$color" | xclip -selection clipboard && notify-send "Gpick" "Скопировано: $color"
