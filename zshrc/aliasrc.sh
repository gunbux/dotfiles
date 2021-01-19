#!/bin/sh

# aliasrc.sh - Contains all useful aliases for use in bash or zsh. Source it in bashrc or zshrc to use it.
# A lot of these are taken from personal experiences, as well as Mental Outlaws aliases.

# Use neovim when possible
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# Beginning of aliases

# Unix utilities
alias \
	ip="curl ipinfo.io/ip" \
	ports="netstat -tulanp" \
	untar="tar -zxvf" \
	sha="shasum -a 256" \

# QOL aliases
alias \
	cl="clear" \
	nf="neofetch" \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -v" \
	mkdir="mkdir -pv" \

# ls aliases
alias \
	lm="ls -t -1" \
	lb="ls -h -1 -S" \

# Specific Programs aliases
alias \
	yt="youtube-dl --addmetadata -i" \
	yta="yt -x -f bestaudio/best" \
	python="python3" \
	py="python"
	g="git" \
	sdn="shutdown -h now" \
	f="$FILE" \
	e="$EDITOR" \
	v="vim" \

# Adds colour to commands
alias \
	ls="ls -h --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \

