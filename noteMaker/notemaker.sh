#!/bin/bash

noteFilename="$HOME/Notes/note-$(date +%Y-%m-%d).md"

if [ ! -f $noteFilename ]; then
  echo "# Notes for $(date +%Y-%m-%d)" > $noteFilename
fi

gnome-terminal --geometry=63x23 -- nvim -c ":ASToggle" -c "norm Go" \
  -c "norm Go## $(date +%H:%M)" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $noteFilename
