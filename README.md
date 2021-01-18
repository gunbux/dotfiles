# Chun's Personal Dotfiles

This repo will contain all my personal dotfiles

## Currently in repo:
1. neovim
2. bspwm
3. sxhkd
4. scripts

## Things Missing:

- Password Manager
- Wallpaper configuration
- Polybar configuration
- Picom configuration

## TODO:
1. Create scripts for installing linux, managing xrandr and other misc. tasks.
2. Create script for symlinking all dotfiles from git repo.

## Branches
As of January 2021, this repo will have two branches for two of my machines, my first main machine, and my iPad running Alpine Linux via iSH.

# The iPad Branch
This branch will be used mainly for my iPad Air 3 running Alpine on iSH. Due to the low RAM,  I found that the dotfiles I use, such as those for neovim cause the development environment to be slightly laggy and unresponsive, so this branch will provide a more skeletal version of the main dotfiles I use on my machine.

## Issues
- Currently, with a skeletal settings.vim, the neovim config is quite laggy in insert mode, not sure what is causing it. However, it is completely fine when in normal or visual mode, so some config in insert mode probably is the cause.
	- SOLVED: The issue seems to stem from the `set number relativenumber` setting. My guess is that for some reason, relative numbers redraw themselves every key input in insert mode, hence causing the lag, despite lazy redraw being off.
