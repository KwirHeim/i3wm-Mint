#!/bin/bash

BACKUP_DIR="$HOME/AppData/i3wm-Mint/dotfiles"

# Создаём папку
mkdir -p "$BACKUP_DIR"
mkdir -p "$BACKUP_DIR/.config"
mkdir -p "$BACKUP_DIR/.fonts"
#mkdir -p "$BACKUP_DIR/.icons"
#mkdir -p "$BACKUP_DIR/.themes"

# Копируем файлы из домашней папки
cp -vu ~/.bashrc "$BACKUP_DIR/"
cp -vu ~/.profile "$BACKUP_DIR/"
cp -vu ~/.Xresources "$BACKUP_DIR/"
cp -vu ~/.xsettingsd "$BACKUP_DIR/"

# Копируем папки из домашней папки
cp -rvu ~/.fonts/IosevkaTermNerdFont-Bold.ttf "$BACKUP_DIR/.fonts/"

# Копируем папки из .config
cp -rvu ~/.config/alacritty "$BACKUP_DIR/.config/"
cp -rvu ~/.config/dunst "$BACKUP_DIR/.config/"
cp -rvu ~/.config/flameshot "$BACKUP_DIR/.config/"
cp -rvu ~/.config/i3 "$BACKUP_DIR/.config/"
cp -rvu ~/.config/i3status "$BACKUP_DIR/.config/"
cp -rvu ~/.config/i3blocks "$BACKUP_DIR/.config/"
cp -rvu ~/.config/micro "$BACKUP_DIR/.config/"
cp -rvu ~/.config/neofetch "$BACKUP_DIR/.config/"
cp -rvu ~/.config/rofi "$BACKUP_DIR/.config/"
cp -rvu ~/.config/xdg-desktop-portal "$BACKUP_DIR/.config/"

echo "Готово! Конфиги скопированы в $BACKUP_DIR"
