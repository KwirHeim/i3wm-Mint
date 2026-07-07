#!/bin/bash

# Запрос исходного текста
text=$(rofi -dmenu -p "Ввод" -theme-str 'window {width: 50%;}' -theme-str 'listview {lines: 0;}')

if [ -n "$text" ]; then
    # Выбор направления перевода
    direction=$(echo -e "ru → en\nen → ru" | rofi -dmenu -mesg "Перевод" -theme-str 'window {width: 30%;}' -theme-str 'listview {lines: 2;}' -theme-str 'inputbar {enabled: false;}')
    
    case "$direction" in
        "ru → en")
            translation=$(trans -b :en "$text")
            ;;
        "en → ru")
            translation=$(trans -b :ru "$text")
            ;;
        *)
            exit 0
            ;;
    esac
    
    # Показ результата с предложением скопировать
    echo -e "Копировать" | \
    rofi -dmenu \
        -mesg "$translation" \
        -theme-str 'window {width: 50%;}' \
        -theme-str 'listview {lines: 1;}' \
        -theme-str 'inputbar {enabled: false;}' | \
        
    grep -q "Копировать" && \
    echo "$translation" | xclip -selection clipboard && \
    notify-send "Перевод скопирован" "$text → $translation"
fi
