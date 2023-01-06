#!/bin/sh


# Force always
xrandr -s 1680x1050 &
xrandr -s 1920x1080 &
xset s off
xset -dpms
xset r rate 250 50 &
setxkbmap de &
feh --bg-scale ~/.config/images/wallpaper.jpg

COMPOSITOR=picom
NETMON=nm-applet
VOLMON=volumeicon
SCRATCHTERM=tilda
ALL="$COMPOSITOR $NETMON $VOLMON $SCRATCHTERM"

for comp in $ALL
do
    killall $comp
    $comp &
done

