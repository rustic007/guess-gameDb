#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUM=$(shuf -i 1-1000 -n 1)

echo "Enter your username: "
read USER

echo "Hello $USER"

# Parse pipe-separated output correctly
QUERY_RESULT=$($PSQL "SELECT username, best_game, game_played FROM user_info WHERE username = '$USER';")

# Split by pipe delimiter
IFS='|' read -r USERNAME BEST_GAME GAMES_PLAYED <<< "$QUERY_RESULT"

if [[ $USERNAME ]]; then
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USER! It looks like this is your first time here."
  $PSQL "INSERT INTO user_info (username) VALUES ('$USER');" > /dev/null
fi

echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESS=0

while true; do
  read USER_GUESS
  
  if [[ $USER_GUESS -gt $RANDOM_NUM ]]; then
    echo "It's lower than that, guess again: "
    ((NUMBER_OF_GUESS += 1))
  elif [[ $USER_GUESS -lt $RANDOM_NUM ]]; then
    echo "It's higher than that, guess again:"
    ((NUMBER_OF_GUESS += 1))
  elif [[ $USER_GUESS -eq $RANDOM_NUM ]]; then
    ((NUMBER_OF_GUESS += 1))
    echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
    break
  else 
    echo "That is not an integer, guess again:" 
    ((NUMBER_OF_GUESS += 1))
  fi
done

# Update database with final result
if [[ -z $BEST_GAME ]] || [[ $NUMBER_OF_GUESS -lt $BEST_GAME ]]; then
  $PSQL "UPDATE user_info SET best_game = $NUMBER_OF_GUESS, game_played = game_played + 1 WHERE username = '$USER';" > /dev/null
else
  $PSQL "UPDATE user_info SET game_played = game_played + 1 WHERE username = '$USER';" > /dev/null
fi