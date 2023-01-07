#!/bin/sh

THEME_FOLDER=/usr/share/rofi/themes
THEME_NAME=rofi-boot-powermenu.rasi

SUDO_ASKPASS=$(which ssh-askpass)
chosen=$(printf "Power Off\nRestart\nLogout\n" | rofi -dmenu -theme $THEME_FOLDER/$THEME_NAME)
case "$chosen" in
        "Power Off")    sudo -A poweroff ;;
        "Restart")      sudo -A reboot ;;
        "Logout")       kill -9 -1 ;;
        *)              false ;;
esac
