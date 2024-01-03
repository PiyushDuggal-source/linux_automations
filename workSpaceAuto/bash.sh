#! /usr/bin/env bash
Profiles=("Default" "Profile 16")

brave-browser-stable

for index in "${!Profiles[@]}"; do
    profile="${Profiles[index]}"
    wmctrl -s $index
    brave-browser-stable --profile-directory="$profile"
    echo "Running Brave with $profile !"
done

echo "Running Kitty with Neovim ! on 3rd workspace"
sleep 1;
wmctrl -s 3;
sleep 1;
cliq &
sleep 1;
wmctrl -s 4;
sleep 1;
kitty -e nvim;
