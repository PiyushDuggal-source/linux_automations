#!/bin/bash

dirname="$(ls ~/Piyush/Personal-Projects/Javascript -c1 | dmenu -i -l 20 -p 'Select the project')"

found=false

for item in "${array[@]}"; do
  if [[ "$item" == "$dirname" ]]; then
    found=true
    xdotool type "nvim ~/Piyush/Personal-Projects/Javascript/$dirname"
    break
  fi
done

if [[ "$found" == false ]]; then
  xdotool type "~/Piyush/Personal-Projects/Javascript"
fi
