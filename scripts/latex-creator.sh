#!/bin/bash

# ---------------------------------------------------------
# Name:   dmenu-create-latex-doc
# Author: Cyr4x3
# Descr.: Script for launching a dmenu displaying options
#         for creating different types of latex docs.
# ---------------------------------------------------------

declare launcer="rofi -dmenu -i"
#declare launcer="dmenu -i"

declare options=("Article
Essay
Letter
Handout
Presentation
Book
cancel")

choice=$(echo -e "${options[@]}" | $launcher -l -p 'Create new LaTeX file: ')
date=$(date +%F_-_%H%M%S)

case "$choice" in
	cancel)
		echo "Program terminated." && exit 1
	;;
	Article)
		choice="$HOME/Documents/LaTeX/Templates/article.tex"
    filetype="article"
    cp "$choice" $HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex
    file=($HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex)
    exec $TERMINAL -e nvim "${file[@]}"
	;;
	Essay)
		choice="$HOME/Documents/LaTeX/Templates/essay.tex"
    filetype="essay"
    cp "$choice" $HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex
    file=($HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex)
    exec $TERMINAL -e nvim "${file[@]}"
	;;
	Letter)
		choice="$HOME/Documents/LaTeX/Templates/formal_letter.tex"
    filetype="letter"
    cp "$choice" $HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex
    file=($HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex)
    exec $TERMINAL -e nvim "${file[@]}"
	;;
	Handout)
		choice="$HOME/Documents/LaTeX/Templates/handout.tex"
    filetype="handout"
    cp "$choice" $HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex
    file=($HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex)
    exec $TERMINAL -e nvim "${file[@]}"
	;;
	Handout)
		choice="$HOME/Documents/LaTeX/Templates/beamer.tex"
    filetype="beamer"
    cp "$choice" $HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex
    file=($HOME/Documents/LaTeX/"${date}"_-_"${filetype}".tex)
    exec $TERMINAL -e nvim "${file[@]}"
	;;
	Book)
    declare options_2=("Tufte\nWiley-6x9\ncancel")
    choice_2=$(echo -e "${options_2[@]}" | $launcher -p 'Choose Book LaTeX template: ')
    filetype="book"
    case "$choice_2" in
      Tufte)
		    choice="$HOME/Documents/LaTeX/Templates/Book-Tufte/main.tex"
		    path="$HOME/Documents/LaTeX/Templates/Book-Tufte"
		    path_2="$HOME/Documents/LaTeX/"${date}"_-_"${filetype}""
        cp -r "$path" "$path_2" && rm "$path_2"/main.pdf
        file=("$path_2"/main.tex)
        exec $TERMINAL -e nvim "${file[@]}"
      ;;
      Wiley-6x9)
		    choice="$HOME/Documents/LaTeX/Templates/Book-Wiley_-_6x9/w-bktmpl.tex"
		    path="$HOME/Documents/LaTeX/Templates/Book-Wiley_-_6x9"
		    path_2="$HOME/Documents/LaTeX/"${date}"_-_"${filetype}""
        cp -r "$path" "$path_2" && rm "$path_2"/*.pdf && rm "$path_2"/readme.txt
        file=("$path_2"/w-bktmpl.tex)
        exec $TERMINAL -e nvim "${file[@]}"
      ;;
      cancel)
		    echo "Program terminated." && exit 1
      ;;
      *)
        exit 1
    esac
  ;;
	*)
		exit 1
	;;
esac

#Add these other type of files:
#Proc
#Minimal
#Report
#Slides
#Memoir
#Letter
#Beamer
