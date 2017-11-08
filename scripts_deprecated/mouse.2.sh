#! /bin/bash

# Second iteration of mouse changing program, this one gets the correct id for you, minimizing all effort.

LINE=$(xinput list | sed -n '/MOSART/p' | head -1)

NUM=$(xinput list | sed -n '/MOSART/p' | head -1 | grep -Po 'id=.{0,2}' | cut -c4-5)

echo "ID is: $NUM"
# at this point, have correct id number in NUM

xinput set-button-map $NUM 3 2 1
echo "Mouse buttons remapped."

# Do more stuff, use this link:
# https://askubuntu.com/questions/492744/how-do-i-automatically-remap-buttons-on-my-mouse-at-startup
