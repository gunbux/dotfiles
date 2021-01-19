#!/usr/bin/sh

# aliasrc.sh - Contains all useful aliases for use in bash or zsh. Source it in bashrc or zshrc to use it.
# A lot of these are taken from personal experiences, as well as Mental Outlaws aliases.

# Use neovim when possible
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# Beginning of aliases
alias \
	# Unix utilities
	#ip - gets ip
	ip="curl ipinfo.io/ip" \
	ports="netstat -tulanp" \
	untar="tar -zxvf" \
	sha="shasum -a 256" \

	# QOL aliases
	cl="clear" \
	nf="neofetch" \
	# Add prompts when overwriting
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -v" \
	# Creates parent dirs if it does not exist
	mkdir="mkdir -pv" \

	# ls aliases
	# lm - lists last modified 
	lm="ls -t -1" \
	# lb - list bytes: display size and sort by size
	lb="ls --human-readable --size -1 -S --classify" \

	# Specific Programs aliases
	yt="youtube-dl --addmetadata -i" \
	yta="yt -x -f bestaudio/best" \
	g="git" \
	sdn="shutdown -h now" \
	f="$FILE" \
	e="$EDITOR" \
	v="$EDITOR" \

	#Adds colour to commands
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \

