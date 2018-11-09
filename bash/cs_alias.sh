#!/bin/bash

# Some of my custom aliases
# Add them in .bashrc for making them permanent
# cat cs_alias.sh >> .bashrc
alias l='ls -lAh'
alias ll='ls -l'
alias cc='clear'
alias qq='exit'
alias ff='find . -type f -iname'
alias tgz='tar -xvfz'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias pg='ping -c 5 8.8.8.8'
alias df='df -Tha --total'
alias du="du -ach | sort -h"
alias rm='rm -i'
alias free="free -mth"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias myip="curl http://ipecho.net/plain; echo"
alias whoami='whois `myip`'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove'
alias hs='history | grep $1'
alias rld='source ~/.bashrc'