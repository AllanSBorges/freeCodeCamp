#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams,games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE team = '$WINNER'")

    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(team) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into team, $WINNER
      fi

      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE team = '$WINNER'")
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE team = '$OPPONENT'")

    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(team) VALUES ('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into team, $OPPONENT

      fi

      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE team = '$OPPONENT'")
    fi
    
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into game, $WINNER $WINNER_GOALS X $OPPONENT $OPPONENT_GOALS
    fi
    
  fi

done