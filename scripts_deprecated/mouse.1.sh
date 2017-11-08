#!/bin/bash
xinput list
echo "Input mouse ID: "
read id
xinput set-button-map $id 3 2 1
echo "Button mapping switched"
