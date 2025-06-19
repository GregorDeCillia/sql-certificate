#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read username

USER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$username'");
if [[ -z $USER_ID ]]
then
  ADD_USER=$($PSQL "INSERT INTO players(name) VALUES ('$username')")
  USER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$username'");
  echo -e "\nWelcome, $username! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE player_id=$USER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE player_id=$USER_ID;")
  echo -e "\nWelcome back, $username! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#echo $USER_ID

rand=$((1 + RANDOM % 1000));

echo $rand
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
INSERT_GAME=$($PSQL "INSERT INTO games(player_id,guesses) VALUES($USER_ID, $COUNT)")
echo "You guessed it in $COUNT tries. The secret number was $rand. Nice job!"

