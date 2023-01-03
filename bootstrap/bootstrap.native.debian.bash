#!/bin/bash

if [ ! $(id -u) -eq 0 ] ; then
    echo "Please start as root"
    echo "Aborting..."
    exit 1
fi
export DEBIAN_FRONTEND=noninteractive
apt update --yes && apt upgrade --yes
apt install git build-essential lsb-release

