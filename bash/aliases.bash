if [ "$(uname -s)" == "Darwin" ] ; then
	alias ls='ls -G'
else
	alias ls='ls --color=auto'
fi

alias ll='ls -al'
alias grep='grep --color'
