#! /bin/bash

DIR="/home/idontremember/Pictures/Wallpapers"

# need to choose file *.??g ?
FILE=$(/usr/bin/find $DIR -type f | /usr/bin/shuf -n 1)

/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$FILE
