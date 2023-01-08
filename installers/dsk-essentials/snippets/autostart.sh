#!/bin/sh

# Kill old instances
SNIPPETS=~/mps/snippets
$SNIPPETS/autostart_clean.sh

# Force always
xrandr -s 1680x1050 &
xrandr -s 1920x1080 &
xset s off &
xset -dpms &
xset r rate 250 50 &
setxkbmap de &
feh --bg-scale ~/.config/images/wallpaper.jpg &

# Tray apps and daemons
COMPOSITOR=picom
NETMON=nm-applet
VOLMON=volumeicon
SCRATCHTERM=tilda 
SYSMON=gnome-system-monitor
ALL="$COMPOSITOR $NETMON $VOLMON $SCRATCHTERM $SYSMON"
for comp in $ALL
do
    $comp &
done
