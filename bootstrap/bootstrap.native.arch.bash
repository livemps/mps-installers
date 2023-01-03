#!/bin/bash

if [ ! $(id -u) -eq 0 ] ; then
    echo "Please start as root"
    echo "Aborting..."
    exit 1
fi
echo "Yes" | pacman --noconfirm -Syy \
    && echo "Yes" | pacman --noconfirm --needed -Syu 
echo "Yes" pacman --noconfirm --needed -S git base-devel lsb-release
