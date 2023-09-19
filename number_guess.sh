#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
USER_RESULT=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
NUMBER=$(($RANDOM % 1001))
if [[ $USER_RESULT ]] 
then
  RESULT_SEARCH=$($PSQL "SELECT played_games, best_game FROM users WHERE username = '$USERNAME'")
  IFS="|"
  read -r PLAYED_GAMES BEST_GAME <<< $RESULT_SEARCH
  echo "Welcome back, $USERNAME! You have played $PLAYED_GAMES games, and your best game took $BEST_GAME guesses."
  unset IFS

  
else
  RESULT_INSERT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  

fi
echo "Guess the secret number between 1 and 1000:"

TOTAL_GUESS=0
while :
do
  read GUESS
  TOTAL_GUESS=$((TOTAL_GUESS + 1))
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS -eq $NUMBER ]]
    then
      if [[ $BEST_GAME -eq 0 ]] || [[ $BEST_GAME -gt $TOTAL_GUESS ]]
        then
          BEST_GAME=$TOTAL_GUESS
        fi
        INSERT_RESULT=$($PSQL "UPDATE users SET best_game = $BEST_GAME, played_games = $(( $PLAYED_GAMES + 1 )) WHERE username = '$USERNAME'")
        echo "You guessed it in $TOTAL_GUESS tries. The secret number was $NUMBER. Nice job!"
        exit
    else
      if [[ $GUESS -lt $NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi  
     
    fi
  else
     echo "That is not an integer, guess again:"
  fi
done

