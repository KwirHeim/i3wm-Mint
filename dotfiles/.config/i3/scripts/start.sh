#!/bin/sh

if command -v notify-send >/dev/null 2>&1; then
    sleep 2
    errors=0
    missing=""

    # Список процессов для проверки
    processes="dunst xsettingsd lxpolkit flameshot diodon nm-applet pasystray blueman-applet"

    for proc in $processes; do
        if ! pgrep -x "$proc" >/dev/null; then
            errors=$((errors + 1))
            missing="$missing $proc"
        fi
    done

    if [ "$errors" -eq 0 ]; then
        notify-send "i3wm" "Запуск успешно завершен" -t 3000
    else
        notify-send "i3wm" "Ошибка, не запущены: $missing" \
            -t 5000 \
            -u critical
    fi
fi
