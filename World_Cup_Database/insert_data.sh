#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOAL OPPONENT_GOAL
do
  # remove first column
  if [[ $YEAR != year ]]
  then

    # get winner id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    # if not found
    if [[ -z $WINNER_ID ]]
    then
      # insert winner team
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      # get new winner id
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      fi
    fi

    # get opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    # if not found
    if [[ -z $OPPONENT_ID ]]
    then
      # insert OPPONENT team
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      # get new OPPONENT id
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
      fi
    fi

    # insert games

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,'$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOAL, $OPPONENT_GOAL)")

    # check if it done
     if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
     then
        echo -e "\nNew match added between $WINNER - $OPPONENT"
     fi

    #  echo success
  fi

done
