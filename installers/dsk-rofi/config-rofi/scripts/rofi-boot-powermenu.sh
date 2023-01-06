#!/bin/sh

THEME_FOLDER=/usr/share/rofi/themes
THEME_NAME=rofi-boot-powermenu.rasi

chosen=$(printf "Power Off\nRestart\nLogout\n" | rofi -dmenu -theme $THEME_FOLDER/$THEME_NAME)
case "$chosen" in
        "Power Off")    gksudo poweroff ;;
        "Restart")      gksudo reboot ;;
        "Logout")       kill -9 -1 ;;
        *)              false ;;
esac
