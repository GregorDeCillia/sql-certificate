#!/bin/bash

echo Enter your username:
read username

rand=$((1 + RANDOM % 1000));

#echo $rand
COUNT=1

take_guess() {
  echo -e "\n$1"
  read guess
  if [[ ! $guess =~ ^[0-9]+$ ]]
  then
    take_guess "That is not an integer, guess again:"
  elif  [[ $guess > $rand ]]
  then
    ((COUNT++))
    take_guess "It's lower than that, guess again:"
  elif [[ $guess < $rand ]]
  then
    ((COUNT++))
    take_guess "It's higher than that, guess again:"
  else
    echo ''
  fi
}

take_guess "Guess the secret number between 1 and 1000:"

echo "You guessed it in $COUNT tries. The secret number was $rand. Nice job!"

