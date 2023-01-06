#!/bin/bash

THEME_FOLDER=/home/user/mps/repo/mps-installers/installers/dsk-essentials/dotfiles/.config/rofi/config
THEME_NAME=rofi-boot-launcher.rasi

rofi -modi drun,run,window,filebrowser,ssh,keys -show drun \
    -theme $THEME_FOLDER/$THEME_NAME
