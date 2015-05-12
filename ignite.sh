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
MAMPSERVE='alias mamp-serve="/Applications/MAMP/bin/start.sh" && echo"Starting Server: 127.0.0.1:8888/MAMP/" && open http://127.0.0.1:8888/MAMP/'
MAMPSTOP='alias mamp-stop="/Applications/MAMP/bin/stop.sh"'
TESTING='alias marco="echo Polo"'
KILLDS_STORE='alias killds_store="find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch"'

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
$KILLDS_STORE
$TREE
EOF
echo "${yellow}zsh shortcuts ready..."
 
# Setup VIM defaults
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
 
# Refresh bash
sleep 1
source ~/.bash_profile

# Let us know when your done
echo "${green}I'm all done!${nc}"
exit 0
