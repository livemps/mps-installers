#--- Interactive shells only --------------------------------------------------
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# Construct color prompt
source .bashrc_colors
PS1="\
\$(RET=\$? ; if [[ \$RET -gt 0 ]]; then\
    printf \"\\${CPref}\\${BIRed}\\${CSuf}[\$RET]\"; else \
    printf \"\\${CPref}\\${BIGreen}\\${CSuf}[\$RET]\"; fi) \
\$(if [[ \$USER == "root" ]]; then \
    printf \"\\${CPref}\\${BIRed}\\${CSuf}\"; else\
    printf \"\\${CPref}\\${BGreen}\\${CSuf}\"; fi)\
\u\
\001${BIPurple}\002@\
\001${BGreen}\002\h\
\001${BIWhite}\002:\
\001${BBlue}\002\W\
\$(if [[ \$USER == "root" ]]; then \
    printf \"\\${CPref}\\${BIRed}\\${CSuf}\"; else\
    printf \"\\${CPref}\\${BIPurple}\\${CSuf}\"; fi)\
\$\
\001${Color_Off}\002 "
# Check color prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    export PS1=$PS1
else
    export PS1='[\$?] \u@\h:\W\$ '
fi
unset color_prompt force_color_prompt
#--- History ------------------------------------------------------------------
HISTSIZE=9999
HISTFILESIZE=9999
HISTCONTROL=ignoreboth 		# don't put duplicate lines in the history.
shopt -s histappend 		# append to the history file, don't overwrite it
shopt -s checkwinsize 		# update the values of LINES and COLUMNS.
#--- Aliases ------------------------------------------------------------------
source .bashrc_aliases_common
if [ "$(lsb_release -is)" = "Arch" ] ; then
    source .bashrc_aliases_arch
elif [ "$(lsb_release -is)" = "Debian" ] ; then
    source .bashrc_aliases_debian
fi
#--- Bash completion ----------------------------------------------------------
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#--- Environment Variable -----------------------------------------------------
export PATH=$PATH:~/mps/snippets
export EDITOR=nvim
neofetch
