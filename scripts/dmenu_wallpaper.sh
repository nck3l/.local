#!/bin/sh

# Dependencies:
# convert wal xdotool xwallpaper
# uncomment the wal commands to have your color theme match the image
wall_dir=~/Pictures/Wallpapers

wall="$(find "$wall_dir" -type f -name "*.jpg" -o -name "*.png" | shuf -n1)"

magick "$wall" ~/.local/share/bg.jpg
#wal -c
#wal -s -i ~/.local/share/bg.jpg
feh --bg-scale ~/.local/share/bg.jpg
xrdb ~/.cache/wal/colors.Xresources
#xdotool key super+F5
#xwallpaper --zoom ~/.local/share/bg.jpg
