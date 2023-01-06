#!/bin/bash

THEME_FOLDER=/home/user/mps/repo/mps-installers/installers/dsk-essentials/dotfiles/.config/rofi/config
THEME_NAME=rofi-boot-powermenu.rasi

chosen=$(printf "Power Off\nRestart\nLogout\n" | rofi -dmenu -theme $THEME_FOLDER/$THEME_NAME)
case "$chosen" in
        "Power Off")    sudo poweroff ;;
        "Restart")      sudo reboot ;;
        "Logout")       sudo kill -9 -1 ;;
        *)              false ;;
esac
