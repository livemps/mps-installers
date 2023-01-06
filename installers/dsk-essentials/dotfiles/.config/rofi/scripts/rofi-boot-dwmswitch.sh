#!/bin/sh

THEME_FOLDER=/usr/share/rofi/themes
THEME_NAME=rofi-boot-dwmswitch.rasi

cat <<EOF | rofi -dmenu -theme $THEME_FOLDER/$THEME_NAME 
[]= Tiled                        Layout	    0
><> Floating                     Layout	    1
[M] Monocle                      Layout	    2
TTT BottomStack    (Vertical)    Layout	    3
=== BottomStack    (Horizontal)  Layout	    4
|M| CenteredMaster (Default)     Layout	    5
>M> CenteredMaster (Floating)    Layout	    6
EOF
