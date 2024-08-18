#!/bin/bash

dirname="$(ls ~/Piyush/Personal-Projects/Python -c1 | dmenu -i -l 20 -p 'Select the project')"

if [ -z "$dirname" ]; then
  exit
fi

xdotool type "nvim ~/Piyush/Personal-Projects/Python/$dirname"
