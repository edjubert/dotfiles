#!/bin/bash

CURRENT=`setxkbmap -query | grep variant`
echo $CURRENT

if [[ "$CURRENT" == *"colemak"* ]];
then
  echo "to US"
  setxkbmap us -option caps:escape
else
  echo "to colemak"
  setxkbmap us -variant colemak -option caps:escape
fi
