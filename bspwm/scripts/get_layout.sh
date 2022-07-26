#!/bin/bash

LAYOUT=`setxkbmap -query | grep "variant"`

if [[ "$LAYOUT" == *"colemak"* ]];
then
  echo "Colemak"
else
  echo "US"
fi
