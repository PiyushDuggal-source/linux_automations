#!/bin/bash

dirname="$(ls ~/Piyush/Personal-Projects/Javascript -c1 | dmenu -i -l 20 -p 'Select the project')"

if [ -z "$dirname" ]; then
  exit
fi

xdotool type "nvim ~/Piyush/Personal-Projects/Javascript/$dirname"
