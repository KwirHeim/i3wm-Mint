#!/bin/bash

# Проверяем playerctl
if ! command -v playerctl &> /dev/null || ! playerctl status &> /dev/null; then
    rofi -e "Нет активных медиаплееров" -theme-str 'window {width: 20%;}'
    exit 0
fi

# Получаем информацию о треке
get_info() {
    title=$(playerctl metadata title 2>/dev/null || echo "Неизвестно")
    artist=$(playerctl metadata artist 2>/dev/null || echo "Неизвестно")
    status=$(playerctl status 2>/dev/null || echo "Stopped")
    
    # Сокращаем длинные строки
    title=${title:0:40}
    artist=${artist:0:30}
    
    echo "$title|$artist|$status"
}

# Показываем меню
info=$(get_info)
IFS='|' read -r title artist status <<< "$info"

# Определяем иконку play/pause
if [[ "$status" == "Playing" ]]; then
    play_text="Пауза"
else
    play_text="Играть"
fi

# Меню
choice=$(echo -e "$play_text\nСледующий\nПредыдущий" | \
    rofi -dmenu \
        -mesg "$artist - $title" \
        -theme-str 'window {width: 50%;}' \
        -theme-str 'listview {lines: 3;}' \
        -theme-str 'inputbar {enabled: false;}' \
        -no-show-match)

# Обработка
case "$choice" in
    *"Пауза"*|*"Играть"*)
        playerctl play-pause
        ;;
    *"Следующий"*)
        playerctl next
        ;;
    *"Предыдущий"*)
        playerctl previous
        ;;
esac
