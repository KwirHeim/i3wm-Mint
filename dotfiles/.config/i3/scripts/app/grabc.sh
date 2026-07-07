#!/bin/bash

color=$(grabc) && echo -n "$color" | xclip -selection clipboard && notify-send "Grabc" "Скопировано: $color"
