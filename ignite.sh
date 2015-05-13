#!/bin/sh
#
# Author: Brandon Crooks
# Version: 2.1
# Description: A shell script that sets preferences
#  for VIM, and aliases for BASH and ZSH. 
#----------Color lib---------------------
yellow="\033[0;33m"
green="\033[0;32m"
nc="\033[0m"
#----------------------------------------

# Setup file paths
Bash_Profile="$HOME/.bash_profile"
ZSHRC="$HOME/.zshrc"
VIMRC="$HOME/.vimrc"

## Setup alias variables
# Add MAMP shortcuts only if MAMP exists
if [[ -d "/Applications/MAMP" ]]; then
  MAMPSERVE='alias mamp-serve="/Applications/MAMP/bin/start.sh" &&
    echo"Starting Server: 127.0.0.1:8888/MAMP/" && open
    http://127.0.0.1:8888/MAMP/'
  MAMPSTOP='alias mamp-stop="/Applications/MAMP/bin/stop.sh"'
else
  MAMPSERVE='alias mamp-serve="echo MAMP is either not installed or in its
  default location."'
  MAMPSTOP='alias mamp-serve="echo MAMP is either not installed  or in its
  default location."'
fi
TESTING='alias marco="echo Polo"'

## Add shortcuts to .bash_profile
/bin/cat <<EOF >> $Bash_Profile
$MAMPSERVE
$MAMPSTOP
$TESTING
EOF
echo "${yellow}bash shortcuts ready..."
 
## Add shortcuts to .zshrc
/bin/cat <<EOF >> $ZSHRC
$MAMPSERVE
$MAMPSTOP
$TESTING
EOF
echo "${yellow}zsh shortcuts ready..."
 
## Setup VIM defaults
/bin/cat <<EOF >> $VIMRC
syntax on
set numberwidth=2
set tabstop=2 
set shiftwidth=2 
set expandtab
set softtabstop=2
set shiftround
set autoindent
set relativenumber
set omnifunc=javascriptcomplete#CompleteJS
EOF
echo "${yellow}Vim presets set..."
 
## Refresh
sleep 1
source ~/.bash_profile

## Let us know when your done & exit
echo "${green}I'm all done!${nc}"
# TODO: ask to delete script
# rm -- "$0"
exit 0
