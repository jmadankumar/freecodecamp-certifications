#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only --no-align -c"

NUMBER_GUESS=0

GUESS(){
  # get number from user
  read NUMBER
  ((NUMBER_GUESS++))
  # if input is not integer
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESS
  else
  # if input is wrong
    if [[ $RANDOM_NUMBER != $NUMBER ]]
    then
      
      if [[ $NUMBER -lt $RANDOM_NUMBER ]]
      then
        # if number is less than
        echo "It's lower than that, guess again:"
      else
        # if number is greater than
        echo "It's higher than that, guess again:"
      fi
      GUESS 
    else
      # if input is right
      INSERT_RESULT=$($PSQL "INSERT INTO games(username, guess) VALUES('$USERNAME', $NUMBER_GUESS)")
      echo "You guessed it in $NUMBER_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
    fi 
  fi
}


START_GAME(){
  RANDOM_NUMBER=$(($RANDOM%1001))
  # echo "R-$RANDOM_NUMBER"
  # get the username
  echo "Enter your username:"
  read USERNAME

  # get users games
  GAMES=$($PSQL "SELECT COUNT(*) FROM games WHERE username='$USERNAME'")

  # check if user already played the games

  if [[ $GAMES -gt 0 ]]
  then
    BEST_GAMES=$($PSQL "SELECT MIN(guess) FROM games WHERE username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST_GAMES guesses."
  else
    # if user not found
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  fi

  # Guess the number text
  echo "Guess the secret number between 1 and 1000:"
  # start guessing
  GUESS
  
}

START_GAME
