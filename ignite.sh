#!/bin/sh
#Author: Brandon Crooks
#Description: A shell script that sets preferences
# for VIM, and aliases for BASH and ZSH. 
#----------Color lib---------------------
yellow="\033[0;33m"
green="\033[0;32m"
nc="\033[0m"
#----------------------------------------
# Setup file paths
Bash_Profile="$HOME/.bash_profile"
ZSHRC="$HOME/.zshrc"
VIMRC="$HOME/.vimrc"

# Setup alias variables
MAMPSERVE='alias mamp-serve="/Applications/MAMP/bin/start.sh"'
MAMPSTOP='alias mamp-stop="/Applications/MAMP/bin/stop.sh"'
TESTING='alias marco="echo Polo"'
KILLDS_STORE='alias killds_store="find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch"'
TREE='alias tree='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/" | less''
#HELP='alias ignite help'

# Add shortcuts to .bash_profile
/bin/cat <<EOF >> $Bash_Profile
$MAMPSERVE
$MAMPSTOP
$TESTING 
$KILLDS_STORE
$TREE
EOF
echo "${yellow}bash shortcuts ready..."
 
# Add shortcuts to .zshrc
/bin/cat <<EOF >> $ZSHRC
$MAMPSERVE
$MAMPSTOP
$TESTING 
#$KILLDS_STORE
#TREE
EOF
echo "${yellow}zsh shortcuts ready..."
 
# Setup VIM defaults
/bin/cat <<EOF >> $VIMRC
syntax on
set tabstop=2 shiftwidth=2 expandtab
set relativenumber
set omnifunc=javascriptcomplete#CompleteJS
EOF
echo "${yellow}Vim presets set..."
 
# Let us know when your done
echo "${green}I'm all done!${nc}"
# Refresh bash
sleep 1
source ~/.bash_profile
exit 0
