#!/bin/bash

# Получаем статус текущего плеера
status=$(playerctl status 2>/dev/null)

# Если нет активных плееров
if [[ $? -ne 0 || "$status" == "No players found" ]]; then
    echo "No music"
    exit 0
fi

# Если плеер остановлен
#if [[ "$status" == "Stopped" ]]; then
#    echo "Stopped"
#    exit 0
#fi

# Получаем информацию о треке
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

# Если artist пустой, пробуем получить из title
if [[ -z "$artist" || "$artist" == "Unknown Artist" ]]; then
    # Пытаемся извлечь artist из title (формат "Artist - Title")
    if [[ "$title" == *" - "* ]]; then
        artist="${title%% - *}"
        title="${title#* - }"
    else
        artist=""
    fi
fi

# Если title пустой
if [[ -z "$title" || "$title" == "Unknown Title" ]]; then
    # Пытаемся получить из имени файла
    filename=$(playerctl metadata xesam:url 2>/dev/null | sed 's/.*\///')
    if [[ -n "$filename" ]]; then
        title="${filename%.*}"  # Убираем расширение файла
    else
        title=""
    fi
fi

# Обрезаем длинные строки
#if [[ ${#artist} -gt 30 ]]; then
#    artist="${artist:0:15}…"
#fi

#if [[ ${#title} -gt 50 ]]; then
#    title="${title:0:25}…"
#fi

# Формируем финальную строку
if [[ -n "$artist" && -n "$title" ]]; then
    echo "$artist - $title"
elif [[ -n "$title" ]]; then
    echo "$title"
else
    echo "Unknown track"
fi
