#! /bin/bash

# Script to send a KDE popup reminder to look away from the screen so as to save our eyes
# !!!! If wanted, could alter script to accept cli param $1
export DISPLAY=:0
/usr/bin/kdialog --title 'Eye Saver 20:20:20' --passivepopup 'Save your eyes! Look at something
	20 feet away for 20 seconds every 20 minutes' 20
