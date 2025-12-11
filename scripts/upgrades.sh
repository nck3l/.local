#!/bin/sh

# updates=$(pacman -Qu | grep -Fcv "[ignored]" | sed "s/^//;s/^0$//g")
updates=$(xbps-install -nuMS | wc -l)
    echo "   $updates"
