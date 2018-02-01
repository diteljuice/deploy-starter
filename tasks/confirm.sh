#! /bin/bash

read -p "Do you really want to use the dark side of the --force? Choose your destiny! (yes/no): " answer

if [[ $answer = "yes" ]];
then
  read -p "A Jedi uses the --force for knowledge and defense, never for attack. Are you really sure? (yes/no): " answer
  if [[ $answer = "yes" ]];
  then
    printf "\nDo. Or do not. There is no try.\n"
    printf "...\n"
    printf "But don't say that I havn't warned you!\n"
    echo
    read -n 1 -s -r -p "--- Press any key to continue ---"
  else
    echo "Adventure. Excitement. A Jedi craves not these things."
    exit 1
  fi
else
  echo "Adventure. Excitement. A Jedi craves not these things."
  exit 1
fi
