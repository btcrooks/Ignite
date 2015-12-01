#!/bin/sh
#
# @author: Brandon Crooks
# @version: 1.5
#
# Description: Simple bash functions, preferences
# for VIM, and helpful aliases for BASH and ZSH.
#
#
#----------Color lib---------------------
# yellow="\033[0;33m"
# green="\033[0;32m"
# nc="\033[0m"
green() { printf "\033[32m${1}\033[0m\n"; }
yellow() { printf "\033[33m${1}\033[0m\n"; }
red() { printf "\033[31m${1}\033[0m\n"; }
#----------------------------------------
echo "Uninstalling '.bash_profile'"
rm ~/.bash_profile
echo "Uninstalling '.zshrc'"
rm ~/.zshrc
echo "Uninstalling '.vimrc'"
rm ~/.vimrc
echo "Complete!"
exit 0
