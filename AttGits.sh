#!/bin/bash
n=0
for i in $(find /home/gustavo/ -iname ".git")
do
  n=$((n+1))
done
array=($(find /home/gustavo/ -iname ".git" | sed s/.git//g))
for ((i=0; i<$n; i++))
do
  echo -e "\e[0;32m${array[$i]}\e[0m"
  cd ${array[$i]}
  git status -s
  sleep 1
done
cd
