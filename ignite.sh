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

#Setup alias variables
MAMPSERVE='alias mamp-serve="/Applications/MAMP/bin/start.sh"'
MAMPSTOP='alias mamp-stop="/Applications/MAMP/bin/stop.sh"'
TESTING='alias marco="echo Polo"'

# Add shortcuts to .bash_profile
/bin/cat <<END >> $Bash_Profile
$MAMPSERVE
$MAMPSTOP
$TESTING 
END
echo -e "${yellow}bash shortcuts ready..."
 
# Add shortcuts to .zshrc
/bin/cat <<END >> $ZSHRC
$MAMPSERVE
$MAMPSTOP
$TESTING 
END
echo -e "${yellow}zsh shortcuts ready..."
 
# Setup VIM defaults
/bin/cat <<END >> $VIMRC
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
END
echo -e "${yellow}Vim presets set..."
 
# Let us know when your done
echo -e "${green}I'm all done!${nc}"
