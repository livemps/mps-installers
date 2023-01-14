#!/bin/bash

# --- Config variables --------------------------------------------------------
MPS_USER=mps
MPS_PASS=mps
MPS_ESSENTIALS="git sudo vim build-essential lsb-release"
# --- Commands ----------------------------------------------------------------
CMD_UPD="apt update --yes"
CMD_UPG="apt upgrade --yes"
CMD_CLN="apt autoremove --yes"
CMD_INST="apt install --yes --no-install-recommends"
# --- Common functions --------------------------------------------------------
function check_root() {
    if [ ! $(id -u) -eq 0 ] ; then
        echo "Please start as root"
        echo "Aborting..."
        exit 1
    fi
}
function packages_update_upgrade() {
    export DEBIAN_FRONTEND=noninteractive
    $CMD_UPD && $CMD_UPG
}
function packages_install_essentials() {
    export DEBIAN_FRONTEND=noninteractive
    $CMD_UPD && $CMD_UPG
    $CMD_INST $MPS_ESSENTIALS
    $CMD_CLN
}
function user_create() {
    useradd -s /bin/bash -m $MPS_USER
    usermod -aG sudo $MPS_USER
    touch /etc/sudoers.d/$MPS_USER
    echo "$MPS_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/mps
    echo "${MPS_USER}:${MPS_PASS}" | chpasswd
}
function usage() {
    echo ""
    echo "Usage: $0 [PARAM]"
    echo ""
    echo "  PARAM:"
    echo "    u :   user            (Default: mps)"
    echo "    p :   password        (Default: mps)"
    echo ""
}
# --- Read opts ---------------------------------------------------------------
while getopts ":u:p:" o; do
    case "${o}" in
        u)
            MPS_USER=${OPTARG}
            ;;
        p)
            MPS_PASS=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
#shift $((OPTIND-1))
# --- Invoke ------------------------------------------------------------------
check_root
packages_update_upgrade
packages_install_essentials
user_create
