#!/bin/bash
source progress_bar.sh
setup_scroll_area

n=0
progress=0

for i in $(find $HOME/ -regex "$HOME/[A-Za-z0-9].*\.git")
do
  n=$((n+1))
  
  if [ $n -le 20 ]; then
    progress=$n
    draw_progress_bar $progress
  fi
done

progress=30
draw_progress_bar $progress

array=($(find $HOME/ -regex "$HOME/[A-Za-z0-9].*\.git" | sed s/.git//g))

progress=40
draw_progress_bar $progress

p=$((60/n))

for ((i=0; i<$n; i++))
do
  echo -e "\e[0;32m${array[$i]}\e[0m"
  
  cd ${array[$i]}
  
  git status -s
  
  progress=$((progress+p))
  draw_progress_bar $progress
  
  sleep 0.15
done

progress=100
draw_progress_bar $progress

sleep 0.15
cd
