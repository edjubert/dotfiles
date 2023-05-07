#!/bin/bash
workspaces=$(hyprctl workspaces -j)
workspace_nums=$(echo "$workspaces" | jq '.[]' | jq '.id' | tr '\n' ' ')
active_num=$(hyprctl -j activewindow | jq '.workspace.id')
# read workspace_nums as items into array2
read -a array2 <<< "$workspace_nums"
str=""
for n in "${array2[@]}"
do
  if [ "$n" == "$active_num" ]; then
    str+="|$n|"
  else
    str+=" $n "
  fi
done
echo "$str"
