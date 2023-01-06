#!/bin/bash

THEME_FOLDER=/usr/share/rofi/themes
THEME_NAME=rofi-boot-powermenu.rasi

chosen=$(printf "Power Off\nRestart\nLogout\n" | rofi -dmenu -theme $THEME_FOLDER/$THEME_NAME)
case "$chosen" in
        "Power Off")    sudo poweroff ;;
        "Restart")      sudo reboot ;;
        "Logout")       sudo kill -9 -1 ;;
        *)              false ;;
esac
