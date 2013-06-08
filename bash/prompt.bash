if [ -s "$HOME/.dotfiles/git/git-prompt.sh" ] ; then
	source "$HOME/.dotfiles/git/git-prompt.sh"
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_SHOWUPSTREAM=verbose
	GIT_PS1_SHOWCOLORHINTS=1
	PROMPT_COMMAND='__git_ps1 "\[\e[0;30m\]\h \[\e[1;93m\]\w\[\e[0m\]" "\\\$ "'
fi
