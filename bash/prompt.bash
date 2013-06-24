#!/bin/bash

black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
purple=$(tput setaf 5)
cyan=$(tput setaf 6)
bold=$(tput bold)
underline=$(tput smul)
reset=$(tput sgr0)
branch_name=$(tput bold; tput setaf 4)

if [ -s "$HOME/.dotfiles/git/git-prompt.sh" ]
then
	source "$HOME/.dotfiles/git/git-prompt.sh"
 	GIT_PS1_SHOWDIRTYSTATE=1
 	GIT_PS1_SHOWSTASHSTATE=1
 	GIT_PS1_SHOWUNTRACKEDFILES=1
 	GIT_PS1_SHOWUPSTREAM=verbose
 	GIT_PS1_SHOWCOLORHINTS=1
	PROMPT_COMMAND='__git_ps1 "\[$black\]\u@\h:\[$reset\]\[$yellow$bold\]\w\[$reset\]" "\n[\!] \$ " " [%s]"'
fi
