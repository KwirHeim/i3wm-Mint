#!/bin/bash

BACKUP_DIR="$HOME/AppData/i3wm-Mint/dotfiles"

echo "Установка"

# Установка пакетов
sudo apt update
sudo apt install -y i3 rofi dunst feh picom lxpolkit diodon blueman flameshot playerctl i3lock alacritty kitty gpick xclip translate-shell pavucontrol pasystray arandr network-manager-gnome xfce4-appfinder xdotool brightnessctl xdo xkbset kbdd i3blocks grabc micro lxappearance arc-theme papirus-icon-theme yaru-theme-icon

# Группы
sudo usermod -aG audio,netdev,bluetooth,kvm,scanner,input,render,video $USER

# Flatpak
sudo flatpak override --filesystem=~/.config/i3:ro

# Копирование файлов
cp -v "$BACKUP_DIR"/.bashrc "$BACKUP_DIR"/.profile "$BACKUP_DIR"/.Xresources "$BACKUP_DIR"/.xsettingsd ~/

cp -rv "$BACKUP_DIR"/.fonts/* ~/.fonts/

cp -rv "$BACKUP_DIR"/.config/* ~/.config/

echo "Готово! Перезапустите сессию для применения всех изменений."
