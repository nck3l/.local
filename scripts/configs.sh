#!/bin/bash

# ---------------------------------------------------------
# Name:   			dmenu-edit-configs
# 3rd Author:       Nick Luker
# 2nd Author: 		Cyr4x3
# Orig. Author:     Derek Taylor
# Description:  	dmenu/rofi script for editing some of my more
# 					frequently edited config files.
# ---------------------------------------------------------

# NOTE:
# -----
# This script uses $HOME/.config for most programs. Please change
# to your appropriate directories.
#

launcher="rofi -dmenu -i"
#launcher="dmenu -i"

options="Alacritty\\nAliases\\nConky\\nDmenu\\nDunst\\nDWM\\nlfrc\\nNcmpcpp\\nNeovim\\nPicom\\nQtile\\nSlstatus\\nSlock\\nSt\\nxprofile\\nXresources\\nZathura\\nZshrc\\nQuit"

choice=$(echo -e $options | $launcher -p '  config file')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
    Alacritty)
        file="$HOME/.config/alacritty/alacritty.toml"
    ;;
	Dunst)
		file="$HOME/.config/dunst/dunstrc"
	;;
	lfrc)
		file="$HOME/.config/lf/lfrc"
	;;
	Conky)
		file="$HOME/.config/conky/conky.conf"
	;;
	Ncmpcpp)
		file="$HOME/.config/ncmpcpp/config"
    ;;
	Neovim)
		file="$HOME/.config/nvim/init.vim"
	;;
	Picom)
		file="$HOME/.config/picom/picom.conf"
	;;
	Qtile)
		file="$HOME/.config/qtile/config.py"
	;;
	Dmenu)
		file="$HOME/.config/dmenu-5.3/config.def.h"
	;;
	Slock)
		file="$HOME/.config/slock-1.5/config.def.h"
	;;
	St)
		file="$HOME/.config/st-0.9.2/config.def.h"
	;;
    DWM)
        file="$HOME/.config/dwm-6.5/config.def.h"
    ;;
    Slstatus)
        file="$HOME/.config/slstatus-1.1/config.def.h"
    ;;
	Xresources)
		file="$HOME/.config/x11/xprofile"
 	;;
	xprofile)
		file="$HOME/.Xresources"
 	;;
	Zathura)
		file="$HOME/.config/zathura/zathurarc"
 	;;
	Zshrc)
		file="$HOME/.config/.zshrc"
	;;
	Aliases)
		file="$HOME/.config/zsh/aliases"
	;;
	*)
		exit 1
	;;
esac

exec $TERMINAL -e nvim $file
