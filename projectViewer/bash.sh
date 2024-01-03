#!/bin/bash
# if the first argument is provided then run a different command
# if [ "$1" ]; then
#   cd ~/Piyush/Personal-Projects/Javascript && cd /$1
# else
#   cd ~/Piyush/Personal-Projects/Javascript
# fi
#
#
# my_str="We;welcome;you;on;javatpoint."  
# my_arr=$(echo $my_str | tr ";""\n")
# echo ${my_arr}  
#


# for i in ~/Piyush/Personal-Projects/Javascript/* ; 
# do
#   IFS='/' read -ra ADDR <<< "$i"
# if [ "${ADDR[-1]}" == "$1" ]; then
#     cd $i
#   fi
# done

found=1

if [[ "$1" == "dir" ]]; then
  project-dir
  exit
fi

for i in ~/Piyush/Personal-Projects/Javascript/* ; 
do
  # Extract the directory name (the last part of the path)
  dir_name=$(basename "$i")

  # Check if the directory name matches the provided argument
  if [ "$dir_name" == "$1" ]; then

    # Change the working directory to the matching directory
    echo "Changing to $i"
    nvim "$i"
    # Exit the loop since you found a match
    break

  fi
    found=0
done

if [[ $found -eq 0 ]]; then
  # cd and open nvim
  cd ~/Piyush/Personal-Projects/Javascript && nvim $(fzf --query "$1")
fi
# Loop through directories
# for i in ~/Piyush/Personal-Projects/Javascript/* ; 
# do
#   dir_name=$(basename "$i")
#   if [ "$dir_name" == "$1" ]; then
#     echo "Changing to $i"
#     if nvim "$i"; then
#       echo "Directory changed successfully."
#     else
#       echo "Failed to change directory."
#     fi
#     break
#   fi
# done
