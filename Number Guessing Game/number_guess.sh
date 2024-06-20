#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

COUNT_GUESS=0


MAIN_FUNCTION() {
  echo -e "Enter your username:"
  read NAME

  GET_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
  

  if [[ -z $GET_USER_ID ]]
  then
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$NAME')")

    if [[ $INSERT_USER = 'INSERT 0 1' ]]
    then
      echo -e "Welcome, $NAME! It looks like this is your first time here."
      GET_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")

      GAME $NAME $GET_USER_ID
    fi
  else
    GET_GAME_DATA=$($PSQL "SELECT COUNT(*), MIN(guesses) FROM games WHERE user_id='$GET_USER_ID'")

    if [[ $GET_GAME_DATA = "0|" ]]
    then
      echo -e "Welcome, $NAME! It looks like this is your first time here."
      GAME $NAME $GET_USER_ID
    else
      echo $GET_GAME_DATA | while IFS='|' read GAME_PLAYED BEST_GAME
      do
        echo -e "\nWelcome back, $NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
      done
      GAME $NAME $GET_USER_ID
    fi
  fi
}

GAME() {
  echo "Guess the secret number between 1 and 1000:"

  NUMBER=$(($RANDOM % 1000))
  START_GAME $NUMBER $2
}

START_GAME() {
  ((COUNT_GUESS++))

  read USER_GUESS

  if [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $USER_GUESS > $1 ]]
    then
      echo "It's lower than that, guess again:"
      START_GAME $1 $2
    elif [[ $USER_GUESS < $1 ]]
    then
      echo "It's higher than that, guess again:"
      START_GAME $1 $2
    else
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id,guesses) VALUES($2, $COUNT_GUESS)")

      echo -e "\nYou guessed it in $COUNT_GUESS tries. The secret number was $1. Nice job!"
    fi
  else
    echo That is not an integer, guess again:
    START_GAME $1 $2
  fi
}

MAIN_FUNCTION
