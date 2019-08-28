# ~/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Ensure that /usr/local/bin comes first, and add our own bin(s)
#PATH="/usr/local/bin:$HOME/bin:$HOME/.dotfiles/bin:$PATH"

# Don't put duplicates in history
HISTCONTROL=ignoreboth
# Append to this history file. Please don't overwrite it.
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=10000

# Get boxen environment
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Get all of our .bash files
for f in `find $HOME/.dotfiles -name '*.bash'`
do
	source $f
done

# Get my github token into my environment
[ -f $HOME/.github-token ] && source $HOME/.github-token

# Set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
