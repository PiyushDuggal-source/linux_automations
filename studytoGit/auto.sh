#!/bin/bash

cd ~/Documents/padhai/

GIT='git --git-dir='$PWD'/.git'

gitFunction ()
{
 $GIT status 
 $GIT add .
 $GIT commit -m $1
 $GIT push -u origin master
}


# if the Input is Empty, it will create COMMIT_MESSAGE 
if [[ -z "$1" ]] then
  COMMIT_MESSAGE=`date '+%A %F %T'`
  gitFunction $COMMIT_MESSAGE
else
  gitFunction $1
fi
