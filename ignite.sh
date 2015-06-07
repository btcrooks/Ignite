#!/bin/bash
#
# Author: Brandon Crooks
# Version: 2.1
# Description: A shell script that sets preferences
#  for VIM, and aliases for BASH and ZSH.
#
#----------Color lib---------------------
yellow="\033[0;33m"
green="\033[0;32m"
nc="\033[0m"
#----------------------------------------

# Setup file paths
Bash_Profile="$HOME/.bash_profile"
ZSHRC="$HOME/.zshrc"
VIMRC="$HOME/.vimrc"
LESSFILTER="$HOME/.lessfilter"

# TODO: Check if file exist. If they do, rename them to .bash_profile.ignite.bak && echo backup location.
# Update uninstall to revert back to these files.

## Setup alias variables
# Add MAMP shortcuts only if MAMP exists
if [[ -d "/Applications/MAMP" ]]; then
  MAMPSERVE='alias mamp-serve="sh /Applications/MAMP/bin/start.sh && echo Starting Server: 127.0.0.1:8888/MAMP/ && open http://127.0.0.1:8888/MAMP/"'
  MAMPSTOP='alias mamp-stop="sh /Applications/MAMP/bin/stop.sh"'
else
  MAMPSERVE='alias mamp-serve="echo MAMP is either not installed or in its default location."'
  MAMPSTOP='alias mamp-serve="echo MAMP is either not installed  or in its default location. && echo Stopped Servers"'
fi
# Add iOS Sim shortcuts only if iOS Sim exists
if [[-d "/Applications/Xcode.app/Contents/Developer/Platforms"]]; then
  LAUNCHIOS='alias launch-ios="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"'
else
  LAUNCHIOS='alias launch-ios="echo Xcode is either not installed  or in its
  default location."'
fi
TESTING='alias marco="echo Polo"'

## Add shortcuts to .bash_profile
/bin/cat <<EOF >> $Bash_Profile
# Ignite settings
$MAMPSERVE
$MAMPSTOP
$LAUNCHIOS
$TESTING
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
EOF
echo "${yellow}bash shortcuts installed..."
 
## Add shortcuts to .zshrc
/bin/cat <<EOF >> $ZSHRC
# Ignite Settings
$MAMPSERVE
$MAMPSTOP
$LAUNCHIOS
$TESTING
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
EOF
echo "${yellow}zsh shortcuts installed..."
 
## Setup VIM defaults
/bin/cat <<EOF >> $VIMRC
# Ignite vim settings
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

# Create/Edit .lessfilter
/bin/cat <<EOF >> $LESSFILTER
#!/bin/bash
case "$1" in
    *.awk|*.groff|*.java|*.js|*.m4|*.php|*.pl|*.pm|*.pod|*.sh|\
    *.ad[asb]|*.asm|*.inc|*.[ch]|*.[ch]pp|*.[ch]xx|*.cc|*.hh|\
    *.lsp|*.l|*.pas|*.p|*.xml|*.xps|*.xsl|*.axp|*.ppd|*.pov|\
    *.diff|*.patch|*.py|*.rb|*.sql|*.ebuild|*.eclass)
        pygmentize -f 256 "$1";;
    .bashrc|.bash_aliases|.bash_environment)
        pygmentize -f 256 -l sh "$1"
        ;;
    *)
        grep "#\!/bin/bash" "$1" > /dev/null
        if [ "$?" -eq "0" ]; then
            pygmentize -f 256 -l sh "$1"
        else
            exit 1
        fi
esac
exit 0
EOF

## Refresh
sleep 1
source ~/.bash_profile

## Let us know when your done & exit
echo "${green}I'm all done!${nc}"
# TODO: ask to delete script
echo -n "Clean up? (y/n) "
read CLEANUP
if [[ $CLEANUP = "y" ]]; then
  rm -- "$0"
  echo "Removed ignite.sh"
else
  echo "Leaving files in place"
exit 0
