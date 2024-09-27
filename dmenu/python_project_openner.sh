#!/bin/bash

array=($(ls ~/Piyush/Personal-Projects/Python -c1))

dirname="$(ls ~/Piyush/Personal-Projects/Python -c1 | dmenu -i -l 20 -p 'Select the project')"

found=false

for item in "${array[@]}"; do
  if [[ "$item" == "$dirname" ]]; then
    found=true
    xdotool type "nvim ~/Piyush/Personal-Projects/Python/$dirname"
    break
  fi
done

if [[ "$found" == false ]]; then
  xdotool type "~/Piyush/Personal-Projects/Python"
fi
