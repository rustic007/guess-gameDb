#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUM=$(shuf -i 1-1000 -n 1)


echo "Enter your username: "
read USER

echo "Hello $USER"


USERNAME=$($PSQL "SELECT $USER FROM user_info")

if [[ -z $USERNAME ]]; then
  echo "Welcome, $USER! It looks like this is your first time here."
  
fi